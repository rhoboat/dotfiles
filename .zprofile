# From homebrew installation
eval "$(/opt/homebrew/bin/brew shellenv)"

set_proxy() {
  # Exclude these local & internal domains from the proxy settings
  no_proxy=".docker.internal, *.aexp.com, .aexp.com, localhost, 192.168.99.100, 192.168.99.101, 127.0.0.1"
  export {NO_PROXY,no_proxy}="${no_proxy}"

  local username=$(whoami)
  local password=$(security find-internet-password -a $(whoami) -s proxy.aexp.com -w)
  if [[ -z "$password" ]] || [[ "$password" = "" ]]; then
    echo "Password for 'proxy.aexp.com' not found in keychain"
    echo -n "Enter password: "
    read -s password
    echo
  fi

  local encoded_pass=$(url_encode "$password")
  local url="http://${username}:${encoded_pass}@proxy.aexp.com:8080"

  export {{http,https,ftp,all}_proxy,{HTTP,HTTPS,FTP,ALL}_PROXY}="${url}"
  # Uncomment to see all proxy settings
  #eval "env | rg -i proxy"
}

set_proxy_bak() {
  local username=`whoami`
  local encoded_pass=$(url_encode $(get_proxy_password))

  url=http://${username}:${encoded_pass}\@proxy.aexp.com:8080

  export {{http,https,ftp,all}_proxy,{HTTP,HTTPS,FTP,ALL}_PROXY}="${url}"

  no_proxy=".docker.internal, *.aexp.com, .aexp.com, localhost, 192.168.99.100, 192.168.99.101, 127.0.0.1"
  export {NO_PROXY,no_proxy}="${no_proxy}"
}

# Convenience function to unset proxy variables
unset_proxy() {
  unset {{http,https,ftp,all,no}_proxy,{HTTP,HTTPS,FTP,ALL,NO}_PROXY}
}

get_proxy_password() {
  # Retrieve proxy password from the keychain
  password=$(security find-internet-password -a $(whoami) -s proxy.aexp.com -w)

  # If that is empty, prompt for the password
  if [ -z "$password" ]; then
    echo "Password for proxy.aexp.com not found in keychain"
    read -s -p "Enter password: " password
  fi

  echo $password
}

set_anon_proxy() {
  local url=http://proxy.aexp.com:8080
  export {{http,https,ftp,all}_proxy,{HTTP,HTTPS,FTP,ALL}_PROXY}="${url}"
  local no_proxy="*.aexp.com, .aexp.com, localhost, 127.0.0.1, docker.internal"
  export {NO_PROXY,no_proxy}="${no_proxy}"
}

url_encode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"
}

# Set the proxy for every new shell session
set_proxy

# Get the user email from Git config
getUserEmail() {
  git config --list | grep "user.email" | cut -d'=' -f2
}

# Common Name to Email
# Example usage:
# cnToEmail "Matthew J Potts"
cnToEmail() {
  local cn
  cn=$1
  echo "Searching for email by common came: $cn"
  local pwd
  pwd=$(security find-generic-password -a "$USER" -w)
  local user_email
  user_email=$(getUserEmail)
  local email
  email=$(ldapsearch -o ldif-wrap=no -x -H ldaps://adsldap.aexp.com:636 -b DC=ads,DC=aexp,DC=com -D "$user_email" -w "$pwd" "cn=$cn" | grep "userPrincipalName:" | awk '{print $2}')
  echo "Email: $email"
}

# Email to ADS
# Example usage:
# emailToADS "matthew.j.potts@aexp.com"
emailToADS() {
  local email
  email=$1
  echo "Searching for ADS ID by email: $email"
  local pwd
  pwd=$(security find-generic-password -a "$USER" -w)
  local user_email
  user_email=$(getUserEmail)
  local ads
  ads=$(ldapsearch -o ldif-wrap=no -x -H ldaps://adsldap.aexp.com:636 -b DC=ads,DC=aexp,DC=com -D "$user_email" -w "$pwd" "userPrincipalName=$email" | grep "^uid:" | awk '{print $2}')
  echo "ADS ID: $ads"
}
