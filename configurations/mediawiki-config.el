(require 'mediawiki)

(add-to-list 'mediawiki-site-alist '("Helpshift"
                                     "http://wiki.helpshift.com/"
                                     "kiran"
                                     ""
                                     "Main Page"))

(setq mediawiki-site-default "Helpshift")

(provide 'mediawiki-config)
