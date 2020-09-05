#  LandChat for Mac

LandChat is a simple chatting application like hack.chat.

LandChat is powered by [@EricNTH080103](https://github.com/ericnth080103).

The macOS application is developed by [@23786](https://github.com/23786).

The chat server is at [landchat.ericnth.cn](http://landchat.ericnth.cn/).

## How to send a message

- `SENDER`: The nickname of the sender of the message.
- `CHATROOMNAME`: Whatever chatroom name you want.
- `MESSAGE`: The text you want to send.

```text
http://landchat.ericnth.cn/addmsg.php?usr=SENDER&room=CHATROOMNAME&msg=MESSAGE
```
The server will return `Succeed`.

## How to view the chat history

> Please replace `CHATROOMNAME` with your chatroom name.

```text
http://landchat.ericnth.cn/chatdata/roomCHATROOMNAME.txt
```
The chat history is in this text file.
