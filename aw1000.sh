#!/bin/sh

export LN='\e[34m'
export BG='\e[44m'
export NC='\e[0m'
export GR='\e[32m'
export RD='\e[31m'
export YL='\e[33m'
export CY='\e[36m'

API_KEYL_B64="aHR0cHM6Ly9hcGkuZG90eWNhdC5jb20vZG90eQ=="
API_KEYL="$(printf '%s' "$API_KEYL_B64" | base64 -d)"

FW1_NAME="${YL}[2026]${NC} DOTYWRT REV 1.1 • ${GR}PAID${NC}"
FW1_ID="727f7d48e1924b6ce99c1abeb8dbb4a80732ebb4f7ab49d9"

FW2_NAME="${YL}[2025]${NC} DOTYLITE REV 1.0 • ${RD}FREE${NC}"
FW2_ID="0f551c9f2d9e0f57d59a843bf48ca202494927a6cef47003"

FW3_NAME="${YL}[2025]${NC} DOTYLITE QM 1.4 • ${RD}FREE${NC}"
FW3_ID="36225ff611df1db14aa6edc784d66d8563ca075d18ecc8da"

FW4_NAME="${YL}[2025]${NC} DOTYLITE QM 1.3 • ${RD}FREE${NC}"
FW4_ID="31bd4fcbf9d6d984d4d3c2b7aa7be5614d65df6ca071dacd"

show_menu() {
	clear

	echo -e "${LN}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
	echo -e "${LN}┃${NC} ${BG}           DOTYCAT FIRMWARE INSTALLER           ${NC} ${LN}┃${NC}"
	echo -e "${LN}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
	echo -e "${LN}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
	echo -e "${LN}┃${NC}                                                  "
	echo -e "${LN}┃${NC}  ${GR}[01]${NC} • ${FW1_NAME}"
	echo -e "${LN}┃${NC}  ${GR}[02]${NC} • ${FW2_NAME}"
	echo -e "${LN}┃${NC}  ${GR}[03]${NC} • ${FW3_NAME}"
	echo -e "${LN}┃${NC}  ${GR}[04]${NC} • ${FW4_NAME}"
	echo -e "${LN}┃${NC}                                                  "
	echo -e "${LN}┃${NC}  ${RD}[0]${NC} Exit"
	echo -e "${LN}┃${NC}                                                  "
	echo -e "${LN}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
	echo -e "${LN}●━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━●${NC}"
	echo ""
}

install_fw() {
	FW_ID="$1"

	INSTALLER="$(wget -qO- "$API_KEYL")"

	if [ -z "$INSTALLER" ]; then
		echo ""
		echo -e "  ${RD}Failed to download installer from server.${NC}"
		exit 1
	fi

	sh -c "$INSTALLER" -- "$FW_ID"
}

show_menu

printf "  Select firmware [0-3]: "
read -r choice

case "$choice" in
	01|1)
		install_fw "$FW1_ID"
		;;
	02|2)
		install_fw "$FW2_ID"
		;;
	03|3)
		install_fw "$FW3_ID"
		;;
	04|4)
		install_fw "$FW4_ID"
		;;
	00|0)
		echo -e "  ${RD}Exited.${NC}"
		exit 0
		;;
	*)
		echo -e "  ${RD}Invalid selection.${NC}"
		exit 1
		;;
esac
