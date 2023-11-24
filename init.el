(add-to-list 'package-archives '("melpa"
             . "http://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "4c7228157ba3a48c288ad8ef83c490b94cb29ef01236205e360c2c4db200bb18" default))
 '(ispell-dictionary nil)
 '(org-agenda-files '("~/org/all.org"))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus ol-info ol-irc ol-mhe ol-rmail org-tempo ol-w3m))
 '(package-selected-packages
   '(spacemacs-theme nord-theme neotree eglot org-modern cmake-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; general
(menu-bar-mode -1)
(xterm-mouse-mode 1)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
(setq backup-directory-alist '((".*" . "~/.emacs.d/backups")))

; key-bindings
(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-c C-o") 'other-window)

; theme
(load-theme 'nord t)

; org
(require 'org-tempo)
(setq org-use-speed-commands t)
(setq org-directory "~/org")
(setq org-default-notes-file "all.org")
(setq org-agenda-files (list org-directory))

; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
