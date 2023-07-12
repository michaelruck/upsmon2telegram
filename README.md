# upsmon2telegram
<h1>Sending upsmon messages to telegram bot</h1>

<h2>Create telegram bot</h2>
To send a message to Telegram group or channel, you should first create your own bot. Just open Telegram, find @BotFather and type /start. Then follow instructions to create bot and get token to access the HTTP API.

<h2>Create Channel</h2>
Create a new Channel in Telegram and add your bot as a member. So your bot could send messages to the Channel.

In order to get Channel Id, first, post any message to the Channel. Then use this link template to get Channel Id:

https://api.telegram.org/bot<YourBOTToken>/getUpdates

Here is a response example:

{
  "ok":true,
  "result": [
    {
      "update_id":123,
      "channel_post": {
        "message_id":48,
        "chat": {
          "id":-123123123, // this is your channel id
          "title":"Notifications",
          "type":"channel"
        },
        "date":1574485277,
        "text":"test"
      }
    }
  ]
}

<h2>Script to send messages</h2>
Here you will be helped:
https://telegram-bot-sdk.readme.io/reference/sendmessage