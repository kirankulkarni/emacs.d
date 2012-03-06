
;;; Setting up Org default-notes-file 
(setq org-directory "~/.org-files"
      org-archive-directory (concat org-directory "/archived")
      org-archive-location (concat org-archive-directory "/%s_archive::")
      org-default-notes-file (concat org-directory "/captures.org")
      org-completion-use-ido t
      org-agenda-files (list org-directory))


 ;; Copied from Org-mode manual
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Suggestion: Also include global key bindings to create 
;; Inserting org-link in any emacs buffer and and open them
;; (global-set-key "\C-c L" 'org-insert-link-global)
;; (global-set-key "\C-c o" 'org-open-at-point-global)

;; Modifying the Bullets while demoting
(setq org-list-demote-modify-bullet
      '(("+" . "-") ("-" . "+") ("*" . "+")))

;; ---------------
;; TODO keywords
;; ---------------

;; Org Fast tag selection
(setq org-use-fast-todo-selection t)
;; Org log note or time based on keyword action
(setq org-log-into-drawer t
      org-log-reschedule 'note
      org-log-redeadline 'note)
;; ! insert timestamp
;; @ Insert a note
;; / seperates entering action and leaving action of a state
(setq org-todo-keywords
      (quote ((sequence "TODO(t!/!)" "ACTIVE(a@/!)" "WAITING(w@/!)" "COMMITTED(c@/!)" "|" "DONE(d!/!)" "VERIFIED(v!/!)" "JUNKED(j@/!)")
              (sequence "PROJECT(p)" "LATER(l@/!)" "BUG(b!/@)" "FEATURE(f!/!)"
                        "MAINT(m!/!)" "|" "SOMEDAY(s)" "CANCELLED(n@/!)"))))

;; Colorize your keywords
(setq org-todo-keyword-faces
      (quote (("TODO"      :foreground "red"          :weight bold)
              ("ACTIVE"    :foreground "orange"       :weight bold)
              ("WAITING"   :foreground "yellow"       :weight bold)
              ("COMMITTED" :foreground "lightblue"    :weight bold)
              ("VERIFIED"  :foreground "forest green" :weight bold)
              ("DONE"      :foreground "forest green" :weight bold)
              ("JUNKED"    :foreground "lightgreen"   :weight bold))))

;;; Enforcing the todo dependencies so that parent can not be marked as done
;;; until children are done
;;; for complex dependencies checkout org-depend.el
(setq org-enforce-todo-dependencies t
      org-enforce-todo-checkbox-dependencies t)

;; Align all tables at startup
(setq org-startup-align-all-tables t)

;; Read more about TODO habits might be useful for Agenda views later

;; ;; Priorities Will be needed for Agenda Views
(setq org-highest-priority "A"
      org-lowest-priority "E"
      org-default-priority "C"
      org-use-property-inheritance t)

;; If you would like a TODO entry to automatically change to DONE when all children
;; are done, you can use the following setup:
;; (defun org-summary-todo (n-done n-not-done)
;;   "Switch entry to DONE when all subentries are done, to TODO otherwise."
;;   (let (org-log-done org-log-states)
;;                                         ; turn off logging
;;     (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
;; (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


;; ---------------
;; TAGS
;; ---------------

;; Tags List
(setq org-tag-alist '((:startgroup . nil)
                      ("work" . ?w)
                      ("personal" . ?p)
                      (:endgroup . nil)
                      (:startgroup . nil)
                      ("next-release" . ?n)
                      (:endgroup . nil)))

;;; If you find that most of the time you need only a single key press to
;;; modify your list of tags: uncomment the following command
;; (setq org-fast-tag-selection-single-key t)


;; ---------------
;; PROPERTIES
;; ---------------
;;; global properties copied inspired by Bernt Hansen
(setq org-global-properties
      (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00 0:00")
              ("STYLE_ALL" . "habit")))
      org-columns-default-format
      "%80ITEM(Task) %10Effort(Effort){:} %20CLOCKSUM")


;; ---------------
;; CLOCKING
;; ---------------
;;; Resolution of idle-time
;;; k - to keep all (choosing how many minute to keep)
;;; K - to keep all and clock-out
;;; s - discard all of the idle time
;;; S - discard all of the idle time and clock-out
;;; C - Cancel the clock all-together

(org-clock-persistence-insinuate)
(setq org-clock-persist 'history
      org-drawers (quote ("PROPERTIES" "LOGBOOK" "CLOCK"))
      org-clock-into-drawer "CLOCK"
      org-clock-out-when-done t
      org-clock-idle-time 15
      org-clock-persist-file (concat session-files-dir "org-clock-save"))


;; ----------------------
;; Capture-Refile-Archive
;; ----------------------
(setq org-capture-templates
      '(("t" "todo" entry
         (file+headline (concat org-directory "/captures.org") "Tasks")
         "* TODO %?\n%U\n%a\n  %i" :clock-in t :clock-resume t)
        ("j" "journal" entry
         (file+datetree "~/.org-files/journal.org") ; don't know why but (concat org-directory "/journal.org") is not wrking
         "* %? :JOURNAL: \n%U\n   %i" :clock-in t :clock-resume t)
        ("n" "note" entry
         (file+headline (concat org-directory "/captures.org") "Notes")
         "* %? :NOTE: \n%U\n%a\n   %i" :clock-in t :clock-resume t)))

(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 2)
                                 (nil :maxlevel . 2)))
      org-refile-use-outline-path 'file
      ;; Targets start with the file name - allows creating level 1 tasks
      org-outline-path-complete-in-steps nil
      org-refile-allow-creating-parent-nodes 'confirm)

;; ----------------------
;; Agenda
;; ----------------------
;; Undefine C-c [ and C-c ] since this breaks my org-agenda files
;; when directories are included
;; It expands the files in the directories individually
(add-hook 'org-mode-hook (lambda ()
                           (turn-on-font-lock)
                           (org-defkey org-mode-map "\C-c[" 'undefined)
                           (org-defkey org-mode-map "\C-c]" 'undefined)
                           (flyspell-mode 1)))

;;; Always highlight the current agenda line
(add-hook 'org-agenda-mode-hook '(lambda ()
                                   (hl-line-mode 1)))

(setq org-stuck-projects
      '("TODO={.+}-NOTSTUCK/-DONE-ACTIVE-VERIFIED" nil nil "SCHEDULED:\\|DEADLINE:\\")
      org-agenda-span 1
      org-agenda-start-on-weekday nil
      org-agenda-sorting-strategy
      '((agenda habit-down time-up priority-down effort-up category-keep)
       (todo todo-state-up priority-down category-keep)
       (tags priority-down category-keep)
       (search category-keep))
      org-agenda-use-time-grid t
      org-agenda-time-grid
      '(nil "----------------"
            (800 1000 1200 1400 1600 1800 2000))
      org-agenda-log-mode-items '(clock))


;; setup for Reminder
;; setup for Reminder
;; Erase all reminders and rebuild reminders for today from the agenda
(defadvice org-agenda-to-appt (before wickedcool activate)
  "Clear the appt-time-msg-list."
  (setq appt-time-msg-list nil))

(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)

(appt-activate t)

;; If we leave Emacs running overnight -
;; reset the appointments one minute after midnight
(run-at-time "24:01" nil 'org-agenda-to-appt)


;;; Unused variables
;;; org-agenda-todo-ignore-scheduled
;;; org-agenda-todo-ignore-deadlines
;;; org-agenda-todo-ignore-timestamp
;;; org-agenda-todo-ignore-with-date
;;; org-agenda-todo-list-sublevels

;; Calc package is needed for making spreadsheets
(require 'calc)

;; I don't want org mode to export a_b as a subscript b in latex.
;; I mostly write code documents and this is never the intended behavior
;; Copied from Vedang Manerikar's configuration
(setq org-export-with-sub-superscripts nil)
;; Copied from Vedang Manerikar
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
;; allow for export=>beamer by placing #+LaTeX_CLASS: beamer in org files
(add-to-list 'org-export-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage{color}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n
       \\subject{{{{beamersubject}}}}\n"

               ("\\section{%s}" . "\\section*{%s}")

               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))

;; letter class, for formal letters
(add-to-list 'org-export-latex-classes

             '("letter"
               "\\documentclass[11pt]{letter}\n
      \\usepackage{color}\n
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n"

               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; article class, for articles
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass[10pt]{article}
\\usepackage{color}
\\usepackage{listings}
\\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
\\usepackage{verbatim}\n
\\usepackage[left=1in,top=1in,right=1in,bottom=1in,head=0.2in,foot=0.2in]{geometry}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))



;; END of org mode configuration
(provide 'org-mode-config)
