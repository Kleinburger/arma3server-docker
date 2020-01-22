#!/bin/bash
echo "./steamcmd.sh +login $STEAM_USERNAME $STEAM_PASSWORD +force_install_dir /arma3 \\" > moddownload.sh
curl -s --data "collectioncount=1&publishedfileids[0]=1870476066" https://api.steampowered.com/ISteamRemoteStorage/GetCollectionDetails/v1/ \
| jq '.response.collectiondetails[] | .children[] | .publishedfileid' \
| sed 's/^/+workshop_download_item 233780 /' | tr '\n' ' ' \
| sed -e 's/$/ \\/' >> moddownload.sh
echo "+quit" >> moddownload.sh