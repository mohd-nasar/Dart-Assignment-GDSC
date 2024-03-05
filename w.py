import requests

class Post:
    def __init__(self, userId, id, title, body):
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body

def main():
    response = requests.get('https://jsonplaceholder.typicode.com/posts')

    if response.status_code == 200:
        data = response.json()
        fakedata = []

        for a in data:
            fakedata.append(Post(a['userId'], a['id'], a['title'], a['body']))

        for fdata in fakedata:
            if fdata.userId == 1:
                print(f'Post ID: {fdata.id}\nTitle: {fdata.title}\nBody: {fdata.body}\n\n')
    else:
        print(f"Can't fetch HTTP response code: {response.status_code}")

if __name__ == "__main__":
    main()
