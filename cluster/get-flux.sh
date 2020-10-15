VERSION=$(curl --silent "https://github.com/fluxcd/flux/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
curl -sSL -o /usr/local/bin/fluxctl https://github.com/fluxcd/flux/releases/download/$VERSION/fluxctl_linux_amd64
chmod +x /usr/local/bin/fluxctl