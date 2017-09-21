#!/bin/bash

### ~ Change these values! ~ ###

# YouTube channel ID(s)
# Can be multiple channels - eg: `CHANNELIDS=("aaaaaaaaaaaaaaaaaaaa" "bbbbbbbbbbbbbbbbbbbb")`
CHANNELIDS=("ZB24Grussia ")

# Public callback URL
CALLBACKURL="https://www.youtube.com/c/ZB24Grussia"

# Secret - must match ytnotify.php; should be reasonably hard to guess
SECRET="ZB 24-Grussia"

###   ###   ###  ###   ###   ###



for chid in "${CHANNELIDS[@]}"
do
    echo "Subscribing to $chid..."

    curl -X POST https://pubsubhubbub.appspot.com/subscribe \
      -d"hub.mode=subscribe" \
      -d"hub.topic=https://www.youtube.com/xml/feeds/videos.xml?channel_id=$chid" \
      -d"hub.callback=$CALLBACKURL" \
      -d"hub.secret=$SECRET" \
      -d"hub.verify=sync"
done

echo "Done."
