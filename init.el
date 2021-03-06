;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;enabling access to various modes
(require 'helm-dictionary)
(require 'org-install)
(require 'package)
(require 'org-checklist)

;adds one more repo
(add-to-list 'package-archives 
'("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;(package-refresh-contents)


;; System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
    (string-equal system-type "windows-nt"))

;org-mode customise
(require 'org-install)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql . t)))
;; add additional languages with '((language . t)))

(when (system-is-windows)
    (setq win-init-path "c:/Users/aaaaa/AppData/Roaming/.emacs.d/user-scripts")
;;    (setq win-init-ct-path      "C:/.emacs.d/plugins/color-theme")
;;    (setq win-init-ac-path      "C:/.emacs.d/plugins/auto-complete")
;;    (setq win-init-ac-dict-path "C:/.emacs.d/plugins/auto-complete/dict"))
    (add-to-list 'load-path win-init-path)
    (require 'shamanizm "ruHotkeys.el")
    (defun org-my()
      (interactive)
      (find-file "c:/Users/aaaaa/Dropbox/orgfiles/todo.org")
      )
    (setq org-directory "c:/Users/aaaaa/Dropbox/orgfiles/")
    (setq org-mobile-directory "c:/Users/aaaaa/Dropbox/MobileOrg")
    (setq org-mobile-inbox-for-pull "c:/Users/aaaaa/Dropbox/orgfiles/inbox.org")
    '(helm-dictionary-database
      "C:/Users/aaaaa/AppData/Roaming/dict/Wiktionary English-Russian/Wiktionary English-Russian.dict")
    '(org-agenda-files (quote ("c:/Users/aaaaa/Dropbox/orgfiles/todo.org")))
    (prefer-coding-system 'utf-8) ;;provide free use of russian keymap
    '(default-input-method "russian-computer")
;; It will be quite annoying to enter your username and password every time, so you should also use password caching: run git config --global credential.helper wincred to enable it (requires Git for Windows 1.8.1 or greater)
    
    (setenv "GIT_ASKPASS" "git-gui--askpass")
    )
    


(when (system-is-linux)
    (setq unix-init-path         "~/.emacs.d/user-scripts/")
;;    (setq unix-init-ct-path      "~/.emacs.d/plugins/color-theme")
;;    (setq unix-init-ac-path      "~/.emacs.d/plugins/auto-complete")
;;    (setq unix-init-ac-dict-path "~/.emacs.d/plugins/auto-complete/dict"))
    (add-to-list 'load-path unix-init-path)
    (add-to-list 'load-path (expand-file-name "/usr/share/emacs/25.1.50/lisp/org"))
    (require 'shamanizm "ruHotkeys.el")    
    (defun org-my()
      (interactive)
      (find-file "~/Dropbox/orgfiles/todo.org")
      )
    (setq org-directory "~/Dropbox/orgfiles/")
    (setq org-mobile-directory "~/Dropbox/MobileOrg")
    (setq org-mobile-inbox-for-pull "~/Dropbox/orgfiles/inbox.org")
    '(helm-dictionary-database "~/.emacs.d/Wiktionary English-Russian.dict")
    (hlt-replace-highlight-face 'highlight 'hi-yellow)         ;FIX in win
    (load-file "~/Downloads/dvc-snapshot/++build/dvc-load.el") ;FIX in win
    (require 'dvc-autoloads) ; to be able to use distributed version control system
    )


(defun back-window()
(interactive)
(other-window -1)
)

;; script2: various useful features 
(desktop-save-mode 1)
(setq-default word-wrap t)
(setq-default toggle-word-wrap 1)
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "M-.") 'back-window)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-{") 'shrink-window-horizontally)
(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x t") 'helm-dictionary)
(global-set-key (kbd "M-g c") 'ace-jump-mode)
(global-set-key (kbd "M-s M-h") 'hlt-highlight)
(global-set-key (kbd "M-s M-n") 'hlt-next-highlight)
(global-set-key (kbd "M-s M-p") 'hlt-previous-highlight)
(global-set-key (kbd "M-s M-f") 'hlt-replace-highlight-face)
(global-set-key (kbd "C->") 'clone-indirect-buffer-other-window)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x b") 'ibuffer)
;; Electric-modes settings, REPLACE pair by more powerful 
(electric-pair-mode    1) ;; 
(electric-indent-mode -1) ;; 
(column-number-mode t)
(size-indication-mode t)
(global-hl-line-mode t)

(add-hook 'kill-emacs-hook (lambda()
                             '(org-startup-with-latex-preview nil)
                             'org-mobile-push))
(global-visual-line-mode t)

;(require 'dedicated "dedicated.el") TODO

;; Scrolling settings
(setq scroll-step 5) ;; вверх-вниз по 5 строк
(setq scroll-margin 2) ;; сдвигать буфер верх/вниз когда курсор на расстоянии от верхней/нижней границы  
(setq next-screen-context-lines 5)

;; (add-hook post-command-hook
;;           ((when (eq this-command 'newline) lambda()(
;;               'backward-delete-char
;;               'event-apply-control-modifier)
;;             )))

;(global-unset-key (kbd "<return>"))
;(define-prefix-command (kbd "<return>"))
;(global-set-key (kbd "<return>") `event-apply-control-modifier)
;(global-set-key "\C"  (kbd "<return>"))


(defun backward-kill-word-or-region (&optional arg)
  (interactive "P")
  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))

(global-set-key (kbd "C-w") 'backward-kill-word-or-region)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-week-start-day 1)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(helm-dictionary-browser-function nil)
 '(magit-push-arguments nil)
 '(org-agenda-files
   (quote
    ("~/Dropbox/orgfiles/i.org" "~/Dropbox/orgfiles/todo.org" "c:/Users/aaaaa/Dropbox/orgfiles/i.org" "c:/Users/aaaaa/Dropbox/orgfiles/todo.org")))
 '(org-agenda-todo-ignore-scheduled (quote future))
 '(org-agenda-todo-ignore-timestamp (quote past))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (latex . t))))
 '(org-capture-templates
   (quote
    (("s" "somth for testing capture" entry
      (file "~/org/captured.org")
      ""))))
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-backends (quote (ascii html icalendar latex odt org)))
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 2 :html-foreground "Black" :html-background "Transparent" :html-scale 2 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-latex-default-packages-alist
   (quote
    (("english, russian" "babel" t)
     ("AUTO" "inputenc" t)
     ("T1" "fontenc" t)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "longtable" nil)
     ("" "float" nil)
     ("" "wrapfig" nil)
     ("" "rotating" nil)
     ("" "amsmath" t)
     ("" "textcomp" t)
     ("" "marvosym" t)
     ("" "wasysym" t)
     ("" "amssymb" t)
     ("" "hyperref" nil)
     "\\tolerance=1000")))
 '(org-log-into-drawer t)
 '(org-mobile-files (quote (org-agenda-files "todo.org")))
 '(org-odt-preferred-output-format "docx")
 '(org-startup-align-all-tables t)
 '(org-startup-with-latex-preview nil)
 '(org-todo-keyword-faces
   (quote
    (("FAILED" . "red3")
     ("CANCELLED" . "red3")
     ("СЕГОДНЯ" . "magenta")
     ("НЕДЕЛЯ" . "magenta")
     ("ПОЗЖЕ" . "magenta"))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO" "|" "DONE(d)" "FAILED(f)")
     (sequence "ПОЗЖЕ" "НЕДЕЛЯ" "СЕГОДНЯ" "|" "DONE(d)")
     (sequence "|" "CANCELLED(c)"))))
 '(org-todo-repeat-to-state nil)
 '(org-use-sub-superscripts (quote {}))
 '(package-selected-packages
   (quote
    (org-plus-contrib highlight pandoc-mode ace-jump-mode w3 ecb cdlatex gnuplot gnuplot-mode magit smex paredit ido-ubiquitous idle-highlight-mode flex-autopair find-file-in-project dedicated dash better-defaults auctex)))
 '(preview-TeX-style-dir "/home/aaaaa/.emacs.d/elpa/auctex-11.89.1/latex" t)
 '(preview-auto-reveal t)
 '(preview-default-document-pt 12)
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-todo ((t (:foreground "yellow" :weight bold)))))


;; errors highlight
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))

(add-hook 'python-mode-hook 'flymake-mode)

;; autocomplete
;;(require 'pymacs)
;;(pymacs-load "ropemacs" "rope-")

(add-hook 'c-mode-hook 'hs-minor-mode-hook)
;; (add-hook 'hs-minor-mode-hook
;;               (lambda () (local-set-key "\C-c\C-c"
;;                                         hs-mode-prefix-map)))


(put 'scroll-left 'disabled nil)
(add-hook 'sql-mode-hook (lambda() (linum-mode)))
(add-hook 'image-mode-hook (lambda() (visual-line-mode -1)))

(setq case-replace nil)

(put 'downcase-region 'disabled nil)

(defun my-randomize-region (beg end)
    "Randomize lines in region from BEG to END."
    (interactive "*r")
    (let ((lines (split-string
                   (delete-and-extract-region beg end) "\n")))
      (when (string-equal "" (car (last lines 1)))
        (setq lines (butlast lines 1)))
      (apply 'insert
        (mapcar 'cdr
        (sort (mapcar (lambda (x) (cons (random) (concat x "\n"))) lines)
              (lambda (a b) (< (car a) (car b))))))))



;;to decide:
;;imenu to what key?
;;may worth trying (setq show-paren-style 'expression)
