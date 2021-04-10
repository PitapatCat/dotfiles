(require 'package)

; Melpa as default emacs package repository
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
; activate packages
(package-initialize)

(require 'evil)
(evil-mode 1)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; list behavior like in Google Docs
(add-hook 'org-mode-hook (lambda () (org-autolist-mode)))

; word wrap
(add-hook 'org-mode-hook #'(lambda () (visual-line-mode) (org-indent-mode)))

; expands snippets (e.g. code block)
(require 'org-tempo)

(define-key text-mode-map (kbd "TAB") 'self-insert-command);
;; (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(package-selected-packages
   ;; '(org-agenda-property cloud-to-butt-erc cloud-theme twilight-bright-theme base16-theme evil-org org-autolist evil)))
;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; )

; evil-org: provides better vim bindings
(use-package evil-org
  :commands evil-org-mode
  :after org
  :init
  (add-hook 'org-mode-hook 'evil-org-mode)
  :config
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading)))))

;; color scheme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'base16-papercolor-light-light t)
;; (load-theme 'twilight-bright t)
;; (load-theme 'cloud t)

(require 'apropospriate)
(load-theme 'apropospriate-light t)

;; (set-face-attribute 'fringe nil :background nil)
;; (set-face-background 'mode-line "#f3f3f3")
;; (set-face-background 'mode-line-inactive "#f3f3f3")

;; remove tool bar and scroll bar
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; remove bell sound
(setq visible-bell t) 

; relative line numbers
(menu-bar-display-line-numbers-mode 'relative)
(add-hook 'foo-mode-hook #'display-line-numbers-mode)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(linum-relative use-package twilight-bright-theme org-autolist org-agenda-property nlinum-relative evil-org cloud-to-butt-erc cloud-theme base16-theme apropospriate-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
