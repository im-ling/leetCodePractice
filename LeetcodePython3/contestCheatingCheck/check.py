import threading

import requests
import asyncio
import time
import os
import json
import _thread
import time

int_format_len = 5


def generate_urls(contest_number, paginations):
    urls = []
    prefix = "https://leetcode-cn.com/contest/api/ranking/weekly-contest-" + str(contest_number) + "/?pagination="
    suffix = "&region=local"
    for i in range(1, paginations + 1):
        urls.append(prefix + str(i) + suffix)
    return urls


def read_text_file_to_lines(file_path):
    '''
    :param file_path: 输入文件path
    :return: 文件所有行的一个list
    '''
    file_obj = open(file_path, "r")
    lines = file_obj.readlines()
    file_obj.close()
    return lines


def write_lines_to_path(lines, path):
    '''
    :param lines: list
    :param path: 输出文件path
    :return: 无
    '''
    with open(path, 'w') as filehandle:
        for line in lines:
            filehandle.write(line)
        print("writen " + path)


def all_files_in_folder(folder_path):
    result = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            result.append(file)
    return result


def download_codes(urls, urls_results, question_ids, weekly_folder_name):
    def get_current_files(weekly_folder_name, question_id):
        path = os.path.join(weekly_folder_name, str(question_id))
        files = all_files_in_folder(path)
        return files

    async def gather_url_jobs(todo, writen_lock):
        jobs = (download_code_with_submissions_number(cur[0], cur[1], cur[2], writen_lock) for cur in todo)
        gathered = await asyncio.gather(*jobs)
        return gathered

    async def download_code_with_submissions_number(submissions_number, prefix, file_name, lock):
        print(file_name)
        return
        url = "https://leetcode-cn.com/api/submissions/" + str(submissions_number) + "/"
        req = requests.get(url)
        await lock.acquire()
        try:
            content = req.content.decode(req.apparent_encoding)
            dic = json.loads(content)
            code = dic["code"]
            lang = dic["lang"]
            folder_name = os.path.join(prefix, lang)
            if not os.path.isdir(folder_name):
                os.mkdir(folder_name)
            file_path = os.path.join(folder_name, file_name)
            write_lines_to_path(code, file_path)
        finally:
            lock.release()

    submissions_cache = {}
    for qid in question_ids:
        list = get_current_files(weekly_folder_name, qid)
        submissions_cache[qid] = set(list)
    # print(submissions_cache)

    # 需要查询的submission，下载它们到文件
    todo = []
    for i in range(len(urls)):
        url = urls[i]
        submissions = urls_results[url]["submissions"]
        for j in range(len(submissions)):
            submission = submissions[j]
            rank = i * 25 + j + 1
            for qid in question_ids:
                qid_str = str(qid)
                if qid_str in submission:
                    submission_id_str = str(submission[qid_str]["submission_id"])
                    file_name = "rank_" + str(rank).zfill(int_format_len) + "_" + submission_id_str
                    prefix = os.path.join(weekly_folder_name, qid_str)
                    if file_name not in submissions_cache[qid]:
                        todo.append((submission_id_str, prefix, file_name))

    writen_lock = asyncio.Lock()
    gather = gather_url_jobs(todo, writen_lock)
    loop = asyncio.get_event_loop()
    loop.run_until_complete(gather)


def read_url_results(file):
    if os.path.isfile(file):
        with open(file) as json_file:
            data = json.load(json_file)
            if data:
                return data
            else:
                return {}
    else:
        return {}


def creat_folder(contest_number, question_ids):
    result = []
    folder_name = "Weekly_" + str(contest_number)
    result.append(folder_name)
    if not os.path.isdir(folder_name):
        os.mkdir(folder_name)
    for qid in question_ids:
        path = os.path.join(folder_name, str(qid))
        result.append(path)
        if not os.path.isdir(path):
            os.mkdir(path)
    return result


def get_url_returns(urls, local_urls_results, writen_lock):
    async def gather_url_jobs(todo, writen_lock, urls_results):
        jobs = (get_submissions_by_url(cur, writen_lock, urls_results) for cur in todo)
        gathered = await asyncio.gather(*jobs)
        return gathered

    async def get_submissions_by_url(url, lock, results):
        req = requests.get(url)
        # print("get_submissions_by_url", url, req.content)
        await lock.acquire()
        try:
            content = req.content.decode(req.apparent_encoding)
            dic = json.loads(content)
            results[url] = dic
        finally:
            lock.release()

    todo = []
    for url in urls:
        if url not in local_urls_results:
            todo.append(url)
    gather = gather_url_jobs(todo, writen_lock, local_urls_results)
    loop = asyncio.get_event_loop()
    loop.run_until_complete(gather)


def cheating_check_compute_similar(question_ids, weekly_folder_name, threshold):
    def language_check_similar(path, threshold):
        records = {}
        def compute_similars(oneline_dic, one_line, file):
            local_result = []
            one_line_len = len(one_line)
            computer_len = 10
            for key in oneline_dic.keys():
                target_one_line = oneline_dic[key]
                all_count = 0
                similar_count = 0
                for i in range(one_line_len - computer_len):
                    if one_line[i: i + computer_len] in target_one_line:
                        similar_count += 1
                    all_count += 1
                local_result.append([similar_count / all_count, file, key])
            return local_result

        result = []
        files = os.listdir(path)
        files.sort()
        oneline_dic = {}
        count = 0
        for file in files:
            file_path = os.path.join(path, file)
            lines = read_text_file_to_lines(file_path)
            one_line = ""
            for line in lines:
                one_line += line.replace(" ", "")
            if count >= 0:
                similars = compute_similars(oneline_dic, one_line, file)
                similars.sort(key=lambda x: x[0])
                for i in range(len(similars)):
                    status = similars[i]
                    if status[0] >= threshold:
                        result.append(status)
            oneline_dic[file] = one_line
        return result

    for qid in question_ids:
        question_path = os.path.join(weekly_folder_name, str(qid))
        languages = os.listdir(question_path)
        # print(languages)
        for language in languages:
            language_folder = os.path.join(question_path, language)
            if os.path.isdir(language_folder):
                result = language_check_similar(language_folder, threshold)
                result.sort(key=lambda x: x[0])
                if len(result) > 0:
                    print(language_folder)
                    for record in reversed(result):
                        print("%.4f" % record[0], record[1], record[2])

def cheating_check(contest_number, paginations, question_ids, similar_threshold):
    # create folder
    folder_names = creat_folder(contest_number, question_ids)
    # generate urls
    urls = generate_urls(contest_number, paginations)
    url_results_path = os.path.join(folder_names[0], "urls_results.json")
    # read cache
    urls_results = read_url_results(url_results_path)
    writen_lock = asyncio.Lock()
    # get url returns
    get_url_returns(urls, urls_results, writen_lock)
    # write cache to file
    with open(url_results_path, 'w') as outfile:
        json.dump(urls_results, outfile, sort_keys=True, indent=4)
    print(f"Urls returned at {time.strftime('%X')}")

    download_codes(urls, urls_results, question_ids, folder_names[0])
    print(f"download codes finished at {time.strftime('%X')}")


    print("\n\n---- reports: ----")
    cheating_check_compute_similar(question_ids, folder_names[0], similar_threshold)
    print("---- reports end: ----\n\n")

    print(f"similar checking finished at {time.strftime('%X')}")


if __name__ == '__main__':
    print(f"Started at {time.strftime('%X')}")

    # contest number
    contest_number = 253
    # 调查多少页的人
    paginations = 35
    # 需要查抄袭的题目 [2095, 2096]
    # question_id 可用 https://leetcode-cn.com/contest/api/ranking/weekly-contest-253/?pagination=0 查询
    question_ids = [2096]
    # 相似度（高于这个阈值会被记录）
    similar_threshold = 0.85

    result = cheating_check(contest_number, paginations, question_ids, similar_threshold)

    print(f"End at {time.strftime('%X')}")
