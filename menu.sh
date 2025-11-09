GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

while true; do
  clear
  echo -e "${YELLOW}==============================${RESET}"
  echo -e "${GREEN}  SYSTEM MAINTENANCE SUITE${RESET}"
  echo -e "${YELLOW}==============================${RESET}"
  echo "1. Backup Directory"
  echo "2. System Update & Cleanup"
  echo "3. Monitor Logs"
  echo "4. Exit"
  echo -e "${YELLOW}==============================${RESET}"
  read -p "Enter choice [1-4]: " choice

  case $choice in
    1)
      read -p "Enter directory to backup: " dir
      ./backup.sh "$dir"
      read -p "Press Enter to continue..." ;;
    2)
      ./update_cleanup.sh
      read -p "Press Enter to continue..." ;;
    3)
      ./log_monitor.sh ;;
    4)
      echo -e "${GREEN}Goodbye!${RESET}"
      exit 0 ;;
    *)
      echo -e "${RED}Invalid option. Try again.${RESET}"
      sleep 1 ;;
  esac
done
