# upsmon2telegram
<h1>Sending upsmon messages to telegram bot</h1>

<h2>Create telegram bot</h2>
To send a message to Telegram group or channel, you should first create your own bot. Just open Telegram, find @BotFather and type /start. Then follow instructions to create bot and get token to access the HTTP API.

<h2>Create Channel</h2>
Create a new Channel in Telegram and add your bot as a member. So your bot could send messages to the Channel.

In order to get Channel Id, first, post any message to the Channel. Then use this link template to get Channel Id:

<pre>https://api.telegram.org/bot&lt;YourBOTToken&gt;/getUpdates</pre>

Here is a response example:
<pre>
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
</pre>
<h2>Script to send messages</h2>
Here you will be helped about telegram bots:
https://telegram-bot-sdk.readme.io/reference/sendmessage

I have crafted the upsmon2telegram.sh bash script.
First create the file in the right place.
<pre>sudo nano /usr/bin/upsmon2telegram.sh</pre>
Paste the code. Save it. Exit nano.
Make the file executable.
<pre>sudo chmod +x upsmon2telegram.sh</pre>
Test it:
<pre>NOTIFYTYPE=ONBATT upsmon2telegram.sh Test message</pre>


