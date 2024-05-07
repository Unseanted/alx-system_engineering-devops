#!/usr/bin/python3
'''
    this module contains the function top_ten
'''
import requests

def top_ten(subreddit):
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"}
    params = {"limit": 10}

    response = requests.get(url, headers=headers, params=params)

    if response.status_code != 200:
        print(None)
        return

    data = response.json()
    if 'data' not in data or 'children' not in data['data']:
        print(None)
        return

    children = data['data']['children']
    if not children:
        print(None)
        return

    print(f"Top 10 hot posts for subreddit '{subreddit}':")
    for child in children:
        print(child['data']['title'])
