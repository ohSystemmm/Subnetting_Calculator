# ./main.sh to run
# chmod +x main.sh fuer berechtigungen

shCalc() {
    ipAddressDEC=$1
    suffixDEC=$2

    suffixBIN=$((32 - suffixDEC))

    IFS='.' read -r -a ipSplit <<< "$ipAddressDEC"

    networkAddressBIN=$((ipSplit[3] & (0xFF << suffixBIN)))
    networkAddressDEC="${ipSplit[0]}.${ipSplit[1]}.${ipSplit[2]}.$networkAddressBIN"

    brodcastAddressBIN=$((networkAddressBIN | ((1 << suffixBIN) - 1)))
    brodcastAddressDEC="${ipSplit[0]}.${ipSplit[1]}.${ipSplit[2]}.$brodcastAddressBIN"

    firstAddressBIN=$((networkAddressBIN + 1))
    firstAddressDEC="${ipSplit[0]}.${ipSplit[1]}.${ipSplit[2]}.$firstAddressBIN"

    lastAddressBIN=$((brodcastAddressBIN - 1))
    lastAddressDEC="${ipSplit[0]}.${ipSplit[1]}.${ipSplit[2]}.$lastAddressBIN"

    echo "Network Address:   $networkAddressDEC/$suffixDEC"
    echo "Broadcast Address: $brodcastAddressDEC"
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

shCalc "$ipInput" "$suInput"
