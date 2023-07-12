#!/bin/bash

GROUP_ID=XXXXXXX
BOT_TOKEN=YYYYYYY:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY

NOW=$(date)
case "${NOTIFYTYPE}" in
    ONLINE|COMMOK)
        EMOJI=$(echo -e '\U00002714') # white heavy check mark :white_check_mark:
        ;;
    ONBATT|COMMBAD|REPLBATT)
        EMOJI=$(echo -e '\xE2\x9A\xA0') # warning sign :warning:
        ;;
    LOWBATT|FSD|NOCOMM|SHUTDOWN)
        EMOJI=$(echo -e '\xF0\x9F\x86\x98') # squared sos :sos:
        ;;
    NOPARENT)
        EMOJI=$(echo -e '\xF0\x9F\x94\x84') # anticlockwise downwards and upwards open circle arrows :arrows_counterclockwise:
        ;;
    *)
        EMOJI=$(echo -e '\U0001f300') #Swirl
        ;;
esac
EMOJI+=$(echo -e '\xEF\xB8\x8F') # The emoji should be displayed with emoji presentation

MESSAGE="${EMOJI} <b>${UPSNAME} Notification</b>%0A"
MESSAGE+="${NOW}%0ANotify type: $NOTIFYTYPE %0ANotify message: $*"

curl \
-s \
--data "parse_mode=HTML" \
--data "text=$MESSAGE" \
--data "chat_id=$GROUP_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null
