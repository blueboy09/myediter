(setq python-shell-prompt-detect-failure-warning nil)
;; linum mode
(global-linum-mode 1)

;;highlight parentheses
(show-paren-mode t)
(electric-pair-mode t)

;; font
;(set-default-font "Verdana-20")

;; fill-column number
(setq fill-column 115)
(add-hook 'org-mode 'turn-on-auto-fill)

;; color
(set-background-color "black")
(set-foreground-color "white")

;;spell, use for latex 

;;(setq inhibit-startup-message t) ;; hide the startup message

;; ido-mode
(require 'ido)
(ido-mode t)

;; clipboard t
(setq x-select-enable-clipboard t)
(global-set-key (kbd "M-s") 'shell)
(global-set-key (kbd "C-x C-m") 'compile)


;; mepla
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
	 '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
	         '("popkit" . "http://elpa.popkit.org/packages/") t)


(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))



(defvar myPackages
  '(elpy
    flycheck
    py-autopep8))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)



;; 自动完成：company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode); 全局开启
(setq company-show-numbers t); 显示序号
(setq company-idle-delay 0.2); 菜单延迟
(setq company-minimum-prefix-length 1); 开始补全字数

(require 'elpy)
(elpy-enable)
;;(setq python-shell-interpreter "ipython"
;;            python-shell-interpreter-args "-i --simple-prompt")
(setq python-shell-interpreter "jupyter"
            python-shell-interpreter-args "console --simple-prompt")
;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; ---------------------------------------------
;; C-CODE : http://tuhdo.github.io/c-ide.html
;; (unless (package-installed-p 'use-package)
;;   (package-install 'use-package))

;; (require 'use-package)
;; (setq use-package-always-ensure t)

;; (add-to-list 'load-path "~/.emacs.d/custom")


;; (require 'setup-general)
;; (if (version< emacs-version "24.4")
;;     (require 'setup-ivy-counsel)
;;   (require 'setup-helm
;;   (require 'setup-helm-gtags))
;; (require 'setup-ggtags))

;;(use-package helm)
;;(require 'setup-ivy-counsel)
;;(require 'setup-ggtags)

;;(require 'setup-cedet)
;;(require 'setup-editing)

;; ---------------------------------------------
