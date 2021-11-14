import os


number_format_len = 5
target_folder = "/Users/Now/leetCodePractice/LeetcodePython3/contestCheatingCheck/Weekly_253/2096"
for root, dirs, files in os.walk(target_folder):
    for file_name in files:
        items = file_name.split("_")
        if len(items) == 3:
            new_name = items[0] + "_" + items[1].zfill(number_format_len) + "_" + items[2]
            os.rename(os.path.join(root, file_name), os.path.join(root, new_name))

