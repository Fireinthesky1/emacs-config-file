(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes '(doom-laserwave))
 '(custom-safe-themes
   '("ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "c517e98fa036a0c21af481aadd2bdd6f44495be3d4ac2ce9d69201fcb2578533" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "a5270d86fac30303c5910be7403467662d7601b821af2ff0c4eb181153ebfc0a" "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" "871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8" "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012" default))
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(doom-themes magit iedit fill-column-indicator multiple-cursors gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Add Melpa repository if you haven't already
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

; Stop Emacs from losing undo information by
; setting very high limits for undo buffers
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

;; zoom in and out
(global-set-key (kbd "C-=") 'text-scale-increase)

(global-set-key (kbd "C--") 'text-scale-decrease)

;; Whitespace customization
(setq whitespace-style '(face tabs spaces space-mark lines-tail))
(setq whitespace-display-mappings
      '((newline-mark 0 [8729 10])
	(space-mark 32 [183] [46])
	(tab-mark 9 [9655 9] [92 9])))
(global-whitespace-mode 1)

;; use space instead of tabs
(setq-default indent-tabs-mode nil)

; 4-space tabs
(setq tab-width 4)
(setq indent-line-function 'insert-tab)

;; set whitespace mode
(global-whitespace-mode 1)

;; Enable the visual line mode
(global-visual-line-mode 1)

; no screwing with my middle mouse button
(global-unset-key [mouse-2])

;; Map M-p to M-up arrow
(global-set-key (kbd "M-p") (kbd "<C-up>"))

;; Map C-n to C-down arrow
(global-set-key (kbd "M-n") (kbd "<C-down>"))


; Startup windowing
(setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)

;; Enable line numbers
(global-display-line-numbers-mode t)

; Bright-red TODOs
;; Define a font-lock rule to highlight comments containing TODO in C/C++
(font-lock-add-keywords
 'c++-mode
 '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))

;; You can also add the rule to the generic c-mode
(font-lock-add-keywords
 'c-mode
 '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))

;; Define a font-lock rule to highlight comments containing TODO in assembly
(add-hook 'asm-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))))

;; Define a font-lock rule to highlight comments containing TODO in VHDL
(add-hook 'vhdl-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))))

;; disable the start menu
(setq inhibit-startup-screen t)

;; Disable the scroll bar
(scroll-bar-mode -1)

;; Install fill-column-indicator
(use-package fill-column-indicator
  :ensure t)

;; Set the fill indicator at 80
(require 'fill-column-indicator)

;; Set the column at which the vertical line will appear
(setq-default fci-rule-column 80)

;; Enable the vertical line indicator in programming modes
(add-hook 'prog-mode-hook 'fci-mode)

;; You can customize the appearance of the vertical line marker
(setq fci-rule-color "burlywood")

;;;;;;;NOTEPAD++ MULTILINE EDIT AND MOVE LINE;;;;;;;;;;;;;;;
;; Install required packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'multiple-cursors)
  (package-refresh-contents)
  (package-install 'multiple-cursors))

(unless (package-installed-p 'iedit)
  (package-refresh-contents)
  (package-install 'iedit))

;; Enable multiple cursors for multiline editing
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(require 'multiple-cursors)

(defun my/mc/edit-lines-like-notepad++ ()
  "Starts multiple cursors on the active region, like in Notepad++."
  (interactive)
  (mc/edit-lines (region-beginning) (region-end)))

(global-set-key (kbd "M-<up>") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-<down>") 'mc/mark-next-like-this)
(global-set-key (kbd "M-<right>") 'mc/mark-next-like-this-word)
(global-set-key (kbd "M-<left>") 'mc/mark-previous-like-this-word)
(global-set-key (kbd "M-<return>") 'my/mc/edit-lines-like-notepad++)


;; Move lines up and down
(global-set-key (kbd "C-S-<up>") 'move-line-up)
(global-set-key (kbd "C-S-<down>") 'move-line-down)

(defun move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

;; BRIGHT PURPLE NOTE
(defun my-font-lock-add-keywords ()
  "Highlight NOTE comments in bright purple."
  (font-lock-add-keywords
   nil
   '(("\\<\\(NOTE\\)\\>"
      1 '(:foreground "brightmagenta" :weight bold) t))))

(add-hook 'asm-mode-hook 'my-font-lock-add-keywords)
(add-hook 'vhdl-mode-hook 'my-font-lock-add-keywords)
(add-hook 'c-mode-hook 'my-font-lock-add-keywords)
(add-hook 'c++-mode-hook 'my-font-lock-add-keywords)

;; Enable electric-pair-mode for C and VHDL modes
(add-hook 'c-mode-common-hook 'electric-pair-mode)
(add-hook 'vhdl-mode-hook 'electric-pair-mode)
