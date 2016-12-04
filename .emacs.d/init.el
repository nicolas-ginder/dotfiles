
;(add-to-list 'default-frame-alist '(height . 100))
;(add-to-list 'default-frame-alist '(width . 150))

(require 'package)
;; packages
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;(package-refresh-contents)

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))


(package-require 'helm)
(package-require 'helm-swoop)
(package-require 'cyberpunk-theme)
(package-require 'dired+)
(package-require 'js2-mode)
(package-require 'restclient)
(package-require 'rainbow-delimiters)
(package-require 'jq-mode)
(package-require 'haskell-mode)

(tool-bar-mode -1)
(load-theme 'cyberpunk 1)

;; javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Backup files to temp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(add-hook 'js2-mode-hook 'rainbow-delimiters-mode)

(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; helm
(require 'helm)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(helm-mode 1)
(helm-autoresize-mode 1)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(require 'recentf)
(recentf-mode 1)
(run-at-time nil (* 1 60) 'recentf-save-list)


(require 'haskell-interactive-mode)
(require 'haskell-process)
(require 'flymake-haskell-multi)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

(defun turn-on-subword-mode ()
  (interactive)
  (subword-mode 1))
(defun my-haskell-mode-hook ()
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
;  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
  (flymake-haskell-multi-load)
  (ghc-init))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-mode-hook
   (quote
					;    (interactive-haskell-mode turn-on-haskell-indent turn-on-subword-mode turn-on-haskell-decl-scan my-haskell-mode-hook)))
        (interactive-haskell-mode turn-on-subword-mode turn-on-haskell-decl-scan my-haskell-mode-hook)))
 '(haskell-process-type (quote cabal-repl))
 '(package-selected-packages
   (quote
    (flymake-haskell-multi haskell-mode restclient rainbow-delimiters js2-mode jq-mode helm-swoop dired+ cyberpunk-theme))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
