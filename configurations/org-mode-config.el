;; Copied from Org-mode manual
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Suggestion: Also include global key bindings to create 
;; Inserting org-link in any emacs buffer and and open them
;; (global-set-key "\C-c L" 'org-insert-link-global)
;; (global-set-key "\C-c o" 'org-open-at-point-global)

;; Crating custom sparse trees
;; use C-c a <key> 
;; following "FIXME" is just an example.
;; customizations will be added later
(setq org-agenda-custom-commands
'(("f" occur-tree "FIXME")))

;; Modifying the Bullets while demoting
(setq org-list-demote-modify-bullet
      '(("+" . "-") ("-" . "+") ("*" . "+")))

;; ---------------
;; TODO keywords
;; ---------------

;; Org Fast tag selection
(setq org-use-fast-todo-selection t)
;; Org log note or time based on keyword action
(setq org-log-into-drawer t)
;; ! insert timestamp
;; @ Insert a note
;; / seperates entering action and leaving action of a state
(setq org-todo-keywords (quote ((sequence "TODO(t!/!)" "ACTIVE(a@/!)" "WAITING(w@/!)" "COMMITTED(c@/!)" "|" "VERIFIED(v!/!)" "JUNKED(j@/!)"))))

;; Colorize your keywords
(setq org-todo-keyword-faces
      (quote (("TODO"      :foreground "red"          :weight bold)
	      ("ACTIVE"    :foreground "orange"       :weight bold)
	      ("WAITING"   :foreground "yellow"       :weight bold)
	      ("COMMITTED" :foreground "lightblue"    :weight bold)
	      ("VERIFIED"  :foreground "forest green" :weight bold)
              ("JUNKED"    :foreground "lightgreen"   :weight bold))))


;; Align all tables at startup
(setq org-startup-align-all-tables t)

;; Calc package is needed for making spreadsheets
(require 'calc)

;; END of org mode configuration
(provide 'org-mode-config)
