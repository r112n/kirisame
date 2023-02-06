(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(setq custom-file "~/.config/emacs/custom.el")

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(setq inhibit-startup-message t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(column-number-mode 1)

(setq backup-directory-alist '(("." . "~/tmp/")))

(unless (package-installed-p 'moe-theme)
  (package-install 'moe-theme))

(unless (package-installed-p 'abyss-theme)
  (package-install 'abyss-theme))

;; (load-theme 'wombat t)
;; (load-theme 'moe-dark t)
(load-theme 'abyss t)

(global-set-key (kbd "<C-tab>") 'completion-at-point)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree)
  )

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1)
  )

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files)
	 :map helm-map
	 ("C-j" . helm-next-line)
         ("C-k" . helm-previous-line))
  :config
  (helm-mode 1)
  (setq-default helm-M-x-fuzzy-match t)
  )

(setq org-startup-folded t)
(setq org-startup-indented t)
(setq org-startup-with-inline-images nil)

(use-package org-superstar
  :ensure t
  :hook (org-mode . org-superstar-mode))

(use-package org-evil
  :ensure t
  :hook (org-mode . org-evil-mode))

(use-package magit
  :ensure t)

(use-package pdf-tools
  :ensure t)

(use-package which-key
  :ensure t
  :init (which-key-mode 1)
  :config
  (setq which-key-idle-delay 0.3)
  )

(use-package lsp-mode
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode 1))

(use-package auctex
  :ensure t
  :defer t)

(setq TeX-view-program-selection '((output-pdf "PDF Tools")))

(use-package latex-preview-pane
  :ensure t)
