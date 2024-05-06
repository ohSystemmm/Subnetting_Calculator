# python main.sh      to run

# Written with Neovim & Helix

def pyCalc(ipAddressDEC, suffixDEC):
    suffixBIN = 32 - suffixDEC
    ipSplit = []
    for x in ipAddressDEC.split('.'):
        ipSplit.append(int(x))

    networkAddressBIN = ((ipSplit[0] << 24) + (ipSplit[1] << 16) + (ipSplit[2] << 8) + (ipSplit[3] >> suffixDEC << suffixDEC))
    networkAddressDEC = f"{networkAddressBIN >> 24 & 255}.{networkAddressBIN >> 16 & 255}.{networkAddressBIN >> 8 & 255}.{networkAddressBIN & 255}"

    broadcastAddressBIN = (networkAddressBIN | ((1 << suffixBIN) - 1))
    broadcastAddressDEC = f"{broadcastAddressBIN >> 24 & 255}.{broadcastAddressBIN >> 16 & 255}.{broadcastAddressBIN >> 8 & 255}.{broadcastAddressBIN & 255}"

    firstAddressBIN = (networkAddressBIN + 1)
    firstAddressDEC = f"{(firstAddressBIN >> 24) & 255}.{(firstAddressBIN >> 16) & 255}.{(firstAddressBIN >> 8) & 255}.{firstAddressBIN & 255}"

    lastAddressBIN = (broadcastAddressBIN - 1)
    lastAddressDEC = f"{(lastAddressBIN >> 24) & 255}.{(lastAddressBIN >> 16) & 255}.{(lastAddressBIN >> 8) & 255}.{lastAddressBIN & 255}"

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
suInput = int(input("Suffix: "))

# pyCalc("192.168.0.23", 24)
pyCalc(ipInput, suInput)
