;adds one more repo

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives 
'("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


;; System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
    (string-equal system-type "windows-nt"))

(when (system-is-windows)
    (setq win-init-path "c:/Users/aaaaa/AppData/Roaming/.emacs.d/user-scripts")
;;    (setq win-init-ct-path      "C:/.emacs.d/plugins/color-theme")
;;    (setq win-init-ac-path      "C:/.emacs.d/plugins/auto-complete")
;;    (setq win-init-ac-dict-path "C:/.emacs.d/plugins/auto-complete/dict"))
    (add-to-list 'load-path win-init-path)
    (require 'shamanizm "ruHotkeys.el"))
    
;;^provide free use of russian keymap^

(when (system-is-linux)
    (setq unix-init-path         "~/.emacs.d/user-scripts/")
;;    (setq unix-init-ct-path      "~/.emacs.d/plugins/color-theme")
;;    (setq unix-init-ac-path      "~/.emacs.d/plugins/auto-complete")
;;    (setq unix-init-ac-dict-path "~/.emacs.d/plugins/auto-complete/dict"))
    (add-to-list 'load-path unix-init-path)
    (require 'shamanizm "ruHotkeys.el")    )

;; script2: various useful features 
(desktop-save-mode 1)
(setq-default word-wrap t)
(setq-default toggle-word-wrap 1)
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-x") 'smex)
;; Electric-modes settings, REPLACE pair by more powerful 
(electric-pair-mode    1) ;; 
(electric-indent-mode -1) ;; 
(column-number-mode t)
(size-indication-mode t)

;(require 'dedicated "dedicated.el") TODO

;; Scrolling settings
(setq scroll-step 5) ;; вверх-вниз по 1 строке
(setq scroll-margin 2) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  
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

;; (add-hook 'activate-mark-hook
;; (lambda()(global-set-key (kbd "C-w") 'kill-region)
;; ))
;; (add-hook 'deactivate-mark-hook 
;; (lambda()(global-set-key (kbd "C-w") 'backward-kill-word)
;; ))

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
 '(package-selected-packages
   (quote
    (magit smex paredit ido-ubiquitous idle-highlight-mode flex-autopair find-file-in-project dedicated dash better-defaults auctex)))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


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


;org-mode customise
(require 'org-install)
;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-agenda-files (list "c:/Users/aaaaa/Documents/TextDocuments/orgfiles/todo.org"))
(setq org-directory "c:/Users/aaaaa/Documents/TextDocuments/orgfiles/")
(defun org-my()
  (interactive)
  (find-file "c:/Users/aaaaa/Documents/TextDocuments/orgfiles/todo.org")
)

(setq case-replace nil)

(put 'downcase-region 'disabled nil)
;;to decide:
;;imenu to what key?
;;may worth trying (setq show-paren-style 'expression)
