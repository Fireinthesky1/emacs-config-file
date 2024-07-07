(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a" "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "6e33d3dd48bc8ed38fd501e84067d3c74dfabbfc6d345a92e24f39473096da3f" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "9d5124bef86c2348d7d4774ca384ae7b6027ff7f6eb3c401378e298ce605f83a" "b754d3a03c34cfba9ad7991380d26984ebd0761925773530e24d8dd8b6894738" "a6920ee8b55c441ada9a19a44e9048be3bfb1338d06fc41bce3819ac22e4b5a1" "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4" "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "2b20b4633721cc23869499012a69894293d49e147feeb833663fdc968f240873" "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd" "3d3eef7dd80e89aee44be1ff51d8285045615ea3239358a51818f4deaa5bd558" "32f22d075269daabc5e661299ca9a08716aa8cda7e85310b9625c434041916af" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d" "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "691d671429fa6c6d73098fc6ff05d4a14a323ea0a18787daeb93fde0e48ab18b" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "140eabf497e4beafee558178d20a5b5d5a686049d932e533cb3bc14294d2e223" "aaf5db3e9ad0b36165da1aaf4e230d95bf5075f89ffd8349e1fd960993bd2a1d" "b151f70a3f82d7ebc15a758b7644d4d352e54a02b3ce08c9a6969700f46b20c4" "00254b740a694166c1dfab017152da34507d63410e76f4b7d844e5c318c56b8f" "b49cd6de30817237bad924af0f82523d8921507bc092937004cb426c86e4a785" "cc3f311f61b7cee6c8a20a9799484fa61e4729a5607315122cac33c910407eec" "aebb69ad5296b5e4121c2bba97ff171f6b3dc8e92aa568e4b2352f2ebbc45d59" "a4e37dcd536013c70117b9b96ac474345280611fe3dd9666c38900ba5977a478" "3ce3e62344de33a73d3e78fcecd065abd23d38b9aa91bcb5087b8db03f6919a6" "2b127f0ca6a84febbc40b3e6f3e33e6a498be3d098ab11c7f1d3c02c74d266e6" "fefd367561d1fc14a6f323f1afdc2961abb385b04a008ecaf92ec09178aaeecc" "9fc1782772d5d05c10256205f47268d45af7683c337ac8c7db8a8601c322d1c5" "7f5898de4826b74c48dc3fd732ba16dfe348b39210fb8a1de1ff7dd0657dbd81"))
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(ido-completing-read+ gruber-darker-theme smex org-mode cuda-mode use-package doom-themes magit iedit fill-column-indicator multiple-cursors gruvbox-theme diff-hl))
 '(warning-suppress-log-types '(((unlock-file))))
 '(warning-suppress-types '(((unlock-file)))))

;; Add Melpa repository if you haven't already
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; no more C-z
(define-key global-map (kbd "C-z") nil)


;; Install diff-hl if not installed
(unless (package-installed-p 'diff-hl)
  (package-refresh-contents)
  (package-install 'diff-hl))

;; Install org mode if not already installed
(unless (package-installed-p 'org)
  (package-refresh-contents)
  (package-install 'org))

;; org mode keys
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; Stop Emacs from losing undo information
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

;; enable the visual line mode
(global-visual-line-mode 1)

;; cool auto-complete for find file
(unless (package-installed-p 'ido-completing-read+)
  (package-refresh-contents)
  (package-install 'ido-completing-read+))
  (ido-mode 1)
  (ido-everywhere 1)
  (require 'ido-completing-read+)
  (ido-ubiquitous-mode 1)

;; cool auto-complete for meta x smex
(unless (package-installed-p 'smex)
  (package-refresh-contents)
  (package-install 'smex))
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Enable line numbers
(global-display-line-numbers-mode t)

;; display column numbers
(setq column-number-mode t)

(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/src/linux-trees")
                                       filename))
                (setq indent-tabs-mode t)
                (setq show-trailing-whitespace t)
                (c-set-style "linux-tabs-only")))))

;; Remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; set fill column to 100 characters and require final newline
(setq-default fill-column 100
              require-final-newline t)

;; Enable electric-pair mode for auto-insertion of pairs
(electric-pair-mode 1)

;; Set up Emacs to use UTF-8 encoding
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

;; Set default font
(set-frame-font "Liberation Mono" nil t)

;; Set up uniquify to handle buffer names with the same filename
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Use diff-hl to highlight VCS diffs in the fringe
(global-diff-hl-mode)

;; Disable the menu bar, tool bar, and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Map M-p to M-up arrow
(global-set-key (kbd "M-p") (kbd "<C-up>"))

;; Map C-n to C-down arrow
(global-set-key (kbd "M-n") (kbd "<C-down>"))

;; Bright-red TODOs
(font-lock-add-keywords
 'c++-mode
 '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))
(font-lock-add-keywords
 'c-mode
 '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))
(add-hook 'asm-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))))
(add-hook 'vhdl-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)))))

;; Disable the startup screen
(setq inhibit-startup-screen t)

;; Install fill-column-indicator
(use-package fill-column-indicator
  :ensure t)
(require 'fill-column-indicator)
(setq-default fci-rule-column 100)
(add-hook 'prog-mode-hook 'fci-mode)

;; Enable multiple cursors for multiline editing
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
