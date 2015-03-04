clear
echo "SYSTEM UPGRADES"
echo ""
echo "brew tap"
brew tap --repair
echo ""
echo "brew prune"
brew prune
echo ""
echo "brew update && brew upgrade"
brew update && brew upgrade
curl --remote-name https://raw.githubusercontent.com/thoughtbot/laptop/master/mac
sh mac 2>&1 | tee ~/laptop.log
echo ""
echo "updating ruby-build"
cd ~/.rbenv/plugins/ruby-build && git pull
echo ""
echo "updating system gems"
gem update --system
echo ""
echo "pulling reference repo updates"
cd ~/code/REFERENCE
find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
cd ~/code/FRIENDS
find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
echo ""
echo "upgrading npm"
npm install -g npm@latest
cd ~/code
#clear
echo ""
echo "Almost Done"
apm upgrade -y
echo ""
echo "logging installed atom.io packages"
apm ls > ~/.dotfiles/apm_packages
