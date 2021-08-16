import threading

import requests
import asyncio
import time
import os
import json
import _thread
import time


def generate_urls(contest_number, paginations):
    urls = []
    prefix = "https://leetcode-cn.com/contest/api/ranking/weekly-contest-" + str(contest_number) + "/?pagination="
    suffix = "&region=local"
    for i in range(1, paginations + 1):
        urls.append(prefix + str(i) + suffix)
    return urls


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


def download_codes(urls, urls_results, question_ids, weekly_folder_name):
    async def gather_url_jobs(todo, writen_lock):
        jobs = (download_code_with_submissions_number(cur[0], cur[1], writen_lock) for cur in todo)
        gathered = await asyncio.gather(*jobs)
        return gathered

    async def download_code_with_submissions_number(submissions_number, file_name, lock):
        if os.path.isfile(file_name):
            return
        else:
            url = "https://leetcode-cn.com/api/submissions/" + str(submissions_number) + "/"
            req = requests.get(url)
            await lock.acquire()
            try:
                content = req.content.decode(req.apparent_encoding)
                dic = json.loads(content)
                code = dic["code"]
                write_lines_to_path(code, file_name)
            finally:
                lock.release()

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
                    file_path = os.path.join(weekly_folder_name, qid_str, "rank_" + str(rank) + "_" + submission_id_str)
                    todo.append((submission_id_str, file_path))

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


contest_number = 253
paginations = 2
question_ids = [2096]
url_result = []
file_type = {
    "python3": "py",
    "python": "py"
}


def cheating_check():
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


if __name__ == '__main__':
    print(f"Started at {time.strftime('%X')}")
    cheating_check()
    print(f"End at {time.strftime('%X')}")
