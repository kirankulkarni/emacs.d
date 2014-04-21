(:name color-theme-obsidian
       :description "port of the Eclipse theme Obsidian"
       :website "https://github.com/mswift42/obsidian-theme"
       :minimum-emacs-version "24"
       :type github
       :pkgname "mswift42/obsidian-theme"
       :prepare (add-to-list 'custom-theme-load-path default-directory))
