
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


;(package-require 'helm)
(package-require 'helm-swoop)
(package-require 'cyberpunk-theme)
(package-require 'dired+)
(package-require 'js2-mode)
(package-require 'restclient)
(package-require 'rainbow-delimiters)
(package-require 'jq-mode)

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
(run-at-time nil (* 30) 'recentf-save-list)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (haskell-mode restclient rainbow-delimiters pdf-tools js2-mode jq-mode helm-swoop dired+ cyberpunk-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
