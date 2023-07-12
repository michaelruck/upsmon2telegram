# upsmon2telegram
<h1>Sending upsmon messages to telegram bot</h1>
<h2>You have to have a running ups/nut system to use this feature.</h2>
Network UPS Tools (NUT Server) Ultimate Guide
https://www.youtube.com/watch?v=vyBP7wpN72c

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
          "id":<i>-123123123</i>, // this is your channel id
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
<pre>sudo chmod +x /usr/bin/upsmon2telegram.sh</pre>
Test it:
<pre>NOTIFYTYPE=ONBATT upsmon2telegram.sh Test message</pre>
You should receive a message in your telegram channel.

<h2>Make upsmon do the trick</h2>
Edit upsmon.conf
<pre>sudo nano /etc/nut/upsmon.conf</pre>
<pre>
RUN_AS_USER root
  
MONITOR ups@localhost 1 user password master

NOTIFYCMD "upsmon2telegram.sh"

NOTIFYMSG ONLINE      "UPS %s on line power"
NOTIFYMSG ONBATT      "UPS %s on battery"
NOTIFYMSG LOWBATT     "UPS %s battery is low"
NOTIFYMSG FSD         "UPS %s: forced shutdown in progress"
NOTIFYMSG COMMOK      "Communications with UPS %s established"
NOTIFYMSG COMMBAD     "Communications with UPS %s lost"
NOTIFYMSG SHUTDOWN    "Auto logout and shutdown proceeding"
NOTIFYMSG REPLBATT    "UPS %s battery needs to be replaced"
NOTIFYMSG NOCOMM      "UPS %s is unavailable"
NOTIFYMSG NOPARENT    "upsmon parent process died - shutdown impossible"

NOTIFYFLAG ONLINE     SYSLOG+WALL+EXEC
NOTIFYFLAG ONBATT     SYSLOG+WALL+EXEC
NOTIFYFLAG LOWBATT    SYSLOG+WALL+EXEC
NOTIFYFLAG FSD        SYSLOG+WALL+EXEC
NOTIFYFLAG COMMOK     SYSLOG+WALL+EXEC
NOTIFYFLAG COMMBAD    SYSLOG+WALL+EXEC
NOTIFYFLAG SHUTDOWN   SYSLOG+WALL+EXEC
NOTIFYFLAG REPLBATT   SYSLOG+WALL+EXEC
NOTIFYFLAG NOCOMM     SYSLOG+WALL+EXEC
NOTIFYFLAG NOPARENT   SYSLOG+WALL+EXEC
</pre>
Reboot your system.
Pull the plug and see what happens.
Have fun.


