# chmod +755        main.sh for permissions
# ./main.sh         to run

# Written with Neovim & Helix

shCalc() {
    ipAddressDEC=$1
    suffixDEC=$2

    suffixBIN=$((32 - suffixDEC))

    IFS='.' read -r -a ipSplit <<< "$ipAddressDEC"

    networkAddressBIN=$(( (ipSplit[0] << 24) + (ipSplit[1] << 16) + (ipSplit[2] << 8) + (ipSplit[3] >> suffixDEC << suffixDEC)))
    networkAddressDEC="$((networkAddressBIN >> 24 & 255)).$((networkAddressBIN >> 16 & 255)).$((networkAddressBIN >> 8 & 255)).$((networkAddressBIN & 255))"

    broadcastAddressBIN=$((networkAddressBIN | ((1 << suffixBIN) - 1)))
    broadcastAddressDEC="$((broadcastAddressBIN >> 24 & 255)).$((broadcastAddressBIN >> 16 & 255)).$((broadcastAddressBIN >> 8 & 255)).$((broadcastAddressBIN & 255))"

    firstAddressBIN=$((networkAddressBIN + 1))
    firstAddressDEC="$((firstAddressBIN >> 24 & 255)).$((firstAddressBIN >> 16 & 255)).$((firstAddressBIN >> 8 & 255)).$((firstAddressBIN & 255))"

    lastAddressBIN=$((broadcastAddressBIN - 1))
    lastAddressDEC="$((lastAddressBIN >> 24 & 255)).$((lastAddressBIN >> 16 & 255)).$((lastAddressBIN >> 8 & 255)).$((lastAddressBIN & 255))"

    echo "Network Address:   $networkAddressDEC/$suffixDEC"
    echo "Broadcast Address: $broadcastAddressDEC"
    echo "First Address:     $firstAddressDEC"
    echo "Last Address:      $lastAddressDEC"
}

header() {
   echo "  ____        _                _   _   _              "
   echo " / ___| _   _| |__  _ __   ___| |_| |_(_)_ __   __ _  "
   echo " \___ \| | | | '_ \| '_ \ / _ \ __| __| | '_ \ / _' | "
   echo "  ___) | |_| | |_) | | | |  __/ |_| |_| | | | | (_| | "
   echo " |____/ \__,_|_.__/|_| |_|\___|\__|\__|_|_| |_|\__, | "
   echo "                                               |___/  "
   echo "   ____      _            _       _                   "
   echo "  / ___|__ _| | ___ _   _| | __ _| |_ ___  _ __       "
   echo " | |   / _' | |/ __| | | | |/ _' | __/ _ \| '__|      "
   echo " | |__| (_| | | (__| |_| | | (_| | || (_) | |         "
   echo "  \____\__,_|_|\___|\__,_|_|\__,_|\__\___/|_|         "
   echo -e "\n\n"
}

header
echo -n "IP Address:  "
read ipInput
echo -n "Suffix: "
read suInput
echo -e "\n"

#shCalc "192.168.0.23" "24"
shCalc "$ipInput" "$suInput"
