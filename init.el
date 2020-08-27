;;  SusanKoju                            _       _
;;    ___ _ __ ___   __ _  ___ ___    __| | ___ | |_
;;   / _ \ '_ ` _ \ / _` |/ __/ __|  / _` |/ _ \| __|
;;  |  __/ | | | | | (_| | (__\__ \ | (_| | (_) | |_
;;   \___|_| |_| |_|\__,_|\___|___/  \__,_|\___/ \__|

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-milkbox" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(unless package-archive-contents 
  (package-refresh-contents))

;; For package.el signature check failure
(setq package-check-signature nil)

(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(global-linum-mode 1)
(show-paren-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
;; syntax highlighting
(global-font-lock-mode t)

(iswitchb-mode 1)
(eshell)
(split-window-below)
(dired "./")
;; replace current dired buffer with another buffer
(put 'dired-find-alternate-file 'disabled nil)

;; yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/load-directory "~/.emacs.d/snippets")
(setq yas/indent-line nil)
(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
;;(define-key yas-minor-mode-map (kbd "SPC") nil)

;; auto-complete
(require 'auto-complete)
(setq ac-dwim t)
(ac-config-default)
(setq ac-sources '(ac-source-yasnippet
		   ac-source-abbrev
		   ac-source-words-in-same-mode-buffers))
;; expand only on key press
;;(setq ac-auto-start nil)
;;(ac-set-trigger-key "TAB")
;; make it slower fto save CPU cycles
(setq ac-delay 0.25)

;; slime - Superior Lisp Interaction Mode for Emacs.
(setq inferior-lisp-program (executable-find "sbcl"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (Jadedragon)))
 '(custom-safe-themes
   (quote
    ("e476c3f54a7df4689f3c717afdc6f603b01baaa95955225a35175dba924cf984" "16ed5d79725d8ee017d2a0b1d22164a471d85e02da6edff648a749be4913eb4a" "e18400ada6d3f8bd0e7bf14bcc71f414f69b4f8dd98c828c0a170b2a80e3132b" "0bba58c00eafcc19a5608fa16c4572054f506eb0e9a67cb4f96422edbd2dd3d7" "f22fdaae648758cafb56ac54ac9ef6f6347f8d6dcaf25e4fe23ea1e20e1dbcf6" "d15d6b0601c8e4da6abab8179655f9974855cea55f231a67192d0d87d1821c1b" "d2ad04cdf7af01a803f0dd1b399f3cf0904688121f8a680f7a1af3935f4f1625" default)))
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (auto-complete js-react-redux-yasnippets yasnippet-snippets slime sml-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setenv "PATH" (concat "usr/share/smlnj/bin:" (getenv "PATH")))
(setq exec-path (cons "usr/share/smlnj/bin" exec-path))
;;(load /usr/share/smlnj/bin/sml)

