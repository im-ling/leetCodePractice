import asyncio


async def say_hello(name):
    print(f"hi, {name}")
    await asyncio.sleep(1)
    print(f"i got , {name}")


async def gather_jobs(names):
    jobs = (say_hello(name) for name in names)
    gathered = await asyncio.gather(*jobs)
    return gathered


if __name__ == '__main__':
    names = list("abcdefg")
    loop = asyncio.get_event_loop()
    loop.run_until_complete(gather_jobs(names))
    print("123")

# import heapq
# import threading
# from time import ctime, sleep
# import time
#
#
# def music(func):
#     for i in range(2):
#         sleep(1)
#         print(f"task_complete at {time.strftime('%X')} {func}")
#
# def move(func):
#     for i in range(2):
#         sleep(5)
#         print(f"task_complete at {time.strftime('%X')} {func}")
#
#
#
# if __name__ == '__main__':
#
#     threads = []
#     t1 = threading.Thread(target=music, args=["music1"])
#     threads.append(t1)
#     t2 = threading.Thread(target=move, args=["move2"])
#     threads.append(t2)
#
#     print(f"started at {time.strftime('%X')}")
#
#     for t in threads:
#         t.setDaemon(True)
#         t.start()
#     for t in threads:
#         t.join()
#
#     print(f"finished at {time.strftime('%X')}")
#
