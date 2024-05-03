def pyCalc(a, b):
    ipAddressDEC = a
    suffixDEC = int(b)

    suffixBIN = 0xFFFFFFFF << (32 - suffixDEC)

    ipSplit = ipAddressDEC.split('.')

    networkAddressBIN = int(ipSplit[3]) & suffixBIN
    networkAddressDEC = f"{ipSplit[0]}.{ipSplit[1]}.{ipSplit[2]}.{networkAddressDEC}"

    broadcastAddressBIN = networkAddressBIN | (suffixBIN ^ 0xFFFFFFFF)
    broadcastAddressDEC = f"{ipSplit[0]}.{ipSplit[1]}.{ipSplit[2]}.{broadcastAddressDEC}"

    firstAddressBIN = networkAddressBIN + 1
    firstAddressDEC = f"{ipSplit[0]}.{ipSplit[1]}.{ipSplit[2]}.{firstAddressDEC}"

    lastAddressBIN = broadcastAddressBIN  - 1
    lastAddressDEC = f"{ipSplit[0]}.{ipSplit[1]}.{ipSplit[2]}.{lastAddressDEC}"

    print(f"Network Address:   {networkAddressDEC}/{suffixDEC}")
    print(f"Broadcast Address: {broadcastAddressDEC}")
    print(f"First Address:     {firstAddressDEC}")
    print(f"Last Address:      {lastAddressDEC}")

# def header():
#     print("  ____        _                _   _   _             ")     
#     print(" / ___| _   _| |__  _ __   ___| |_| |_(_)_ __   __ _ ")
#     print(" \___ \| | | | '_ \| '_ \ / _ \ __| __| | '_ \ / _` |")
#     print("  ___) | |_| | |_) | | | |  __/ |_| |_| | | | | (_| |")
#     print(" |____/ \__,_|_.__/|_| |_|\___|\__|\__|_|_| |_|\__, |")
#     print("                                               |___/ ")
#     print("   ____      _            _       _                  ")
#     print("  / ___|__ _| | ___ _   _| | __ _| |_ ___  _ __      ")
#     print(" | |   / _` | |/ __| | | | |/ _` | __/ _ \| '__|     ")
#     print(" | |__| (_| | | (__| |_| | | (_| | || (_) | |        ")
#     print("  \____\__,_|_|\___|\__,_|_|\__,_|\__\___/|_|        ")  
                                               
# header()
ipInput = input("IP Address: ")
suInput = input("Suffix: ")
pyCalc(ipInput, suInput)