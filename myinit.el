(setq inhibit-startup-message t)
(tool-bar-mode -1)
(display-time-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq user-full-name "Karthik Kumar"
      user-mail-address "karthikkumar.s@protonmail.com")

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


(custom-set-variables
 '(org-directory "~/BlackBox/orgfiles")
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overwrite))
 '(org-startup-indented t)
 )

(use-package ace-window
  :ensure t
  :config
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0)))))
  )

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-x l" . counsel-locate))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;; (use-package monokai-theme
;;  :ensure t
;;  :config (load-theme 'monokai t))

(use-package base16-theme
  :ensure t
  )

(use-package moe-theme
  :ensure t)

(moe-dark)
(use-package powerline
  :ensure t
  :config
  (powerline-moe-theme)
  )

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(global-hl-line-mode t)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  (setq beacon-color "#666600"))

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package iedit
  :ensure t)

(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)
(global-set-key (kbd "<f5>") 'revert-buffer)

(use-package speed-type
  :ensure t)

(use-package origami
  :ensure t)

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  )

(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1))))
  )

(use-package pdf-tools
  :ensure t
  )

(use-package sx
  :ensure t
  :config
  (bind-keys :prefix "C-c s"
             :prefix-map my-sx-map
             :prefix-docstring "Global keymap for SX."
             ("q" . sx-tab-all-questions)
             ("i" . sx-inbox)
             ("o" . sx-open-link)
             ("u" . sx-tab-unanswered-my-tags)
             ("a" . sx-ask)
             ("s" . sx-search)))

(use-package mode-icons
  :ensure t
  :config
  (mode-icons-mode))

(use-package guide-key
  :defer t
  :diminish guide-key-mode
  :config
  (progn
    (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c"))
    (guide-key-mode 1)))  ; Enable guide-key-mode

(setq-default tabwidth 4)

(use-package mediawiki
  :ensure t)

;; eclim
;; (require 'eclim)			
;; (require 'eclimd)
;; (global-eclim-mode)

;; (setq eclim-eclipse-dirs "/opt/eclipse")
;; (setq eclim-executable "/opt/eclipse/eclipse")

;; ;; regular auto-complete initialization
;; (require 'auto-complete-config)
;; (ac-config-default)

;; ;; add the emacs-eclim source
;; (require 'ac-emacs-eclim)
;; (ac-emacs-eclim-config)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))

(global-set-key (kbd "<C-kp-divide>") 'comment-or-uncomment-region-or-line)
