#  LandChat for Mac

LandChat is a simple chatting application (a little like hack.chat ?).

The LandChat server and back-end is developed by [@EricNTH080103](https://github.com/ericnth080103).

The macOS application is developed by [@23786](https://github.com/23786).

The chat server is at [landchat.ericnth.cn](https://landchat.ericnth.cn/).

![image.png](https://i.loli.net/2020/09/13/Ec1fkbynUlMwK4H.png)
> Screenshot of macOS Client.

## Currently, registration is not available. The API is still under development.

## How to send a message

-  `ID`: Your user id.
- `CHATROOMNAME`: Whatever chatroom name you want.
- `MESSAGE`: The text you want to send.
- `PASSWORD`: Your password.

```text
https://landchat.ericnth.cn/addmsg.php?id=ID&room=CHATROOMNAME&msg=MESSAGE&pwd=PASSWORD
```

If the password is correct, 

The server will return `Succeed`.

## How to view the chat history

> Please replace `CHATROOMNAME` with your chatroom name.

```text
https://landchat.ericnth.cn/viewjson.php?room=CHATROOMNAME
```
The chat history is in this text file.

## Check your password

```text
https://landchat.ericnth.cn/checkkey.php?id=YOURUSERID&pwd=YOURPASSWORD
````
Returns a JSON result:
- `result`: `Succeed` or `Failed`.
- `name`: The name of this user.
