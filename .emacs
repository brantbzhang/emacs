(global-linum-mode t)
(add-to-list 'load-path "~/.emacs.d") ;; 将软件包所在的路径加到 EMACS 的 load-path
;(add-to-list 'load-path "~/.emacs.d/color") ;; 将软件包所在的路径加到 EMACS 的 load-path
(setq default-directory "~/");;设置打开文件的缺省路径


(defconst my-emacs-path "~/.emacs.d/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "我自己写的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "我下载的emacs lisp包的路径")
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates")

;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)


(tool-bar-mode nil);去掉那个大大的工具栏

(scroll-bar-mode nil);去掉滚动条

;(setq mouse-yank-at-point t);支持中键粘贴
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-use-system-font t)
 '(inhibit-startup-screen t)
 '(size-indication-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans")))))
;;(global-set-key[f6] 'compile);
(global-set-key[f5] 'gdb);
(global-set-key[f8] 'gud-watch);
(global-set-key [(f7)] 'gud-go)
(global-set-key [(f9)] 'gud-step)
(global-set-key [(f10)] 'gud-next)
(global-set-key [(f11)] 'gud-until)
(global-set-key [(f12)] 'gud-finish)
(global-set-key [(f4)] 'gdb-many-windows)
(global-set-key [(f3)] 'gud-tooltip-mode)
;;(setq-default cursor-type 'bar) ;;//光标类型
(add-hook 'c-mode-hook;;缩进样式
   '(lambda ()
      (global-set-key "\C-m" 'newline-and-indent)
      (c-set-style "k&r")))
(add-hook 'c++-mode-hook
   '(lambda()
      (global-set-key "\C-m" 'newline-and-indent)
      (c-set-style "stroustrup"))) 

(show-paren-mode t);;下面的这个设置可以让光标指到某个括号的时候显示与它匹配的括号 
(setq show-paren-style 'parentheses) 


;;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示;
;;这里是直接打开了ido的支持，在emacs23中这个是自带的.
(ido-mode t)

(fset 'yes-or-no-p 'y-or-n-p)
;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。

(setq kill-ring-max 200)
;;设置粘贴缓冲条目数量.用一个很大的kill ring(最多的记录个数). 这样防止我不小心删掉重要的东西


(setq-default auto-fill-function 'do-auto-fill)
; Autofill in all modes;;
(setq default-fill-column 120)
;;把 fill-column 设为 60. 这样的文字更好读


(setq enable-recursive-minibuffers t)
;;可以递归的使用 minibuffers


(setq scroll-margin 3 scroll-conservatively 10000)
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。


(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;设置缺省主模式是text，,并进入auto-fill次模式.而不是基本模式fundamental-mode

(setq auto-image-file-mode t)
;;让 Emacs 可以直接打开和显示图片。


;(auto-compression-mode 1) 
;打开压缩文件时自动解压缩。

(setq frame-title-format "emacs@%b")
;;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用的提示。


(setq-default kill-whole-line t)
;; 在行首 C-k 时，同时删除该行。


 (setq version-control t);;启用版本控制，即可以备份多次
 (setq kept-old-versions 2);;备份最原始的版本两次，及第一次编辑前的文档，和第二次编辑前的文档
 (setq kept-new-versions 1);;备份最新的版本1次，理解同上
 (setq delete-old-versions t);;删掉不属于以上3中版本的版本
 (setq backup-directory-alist '(("." . "~/.backups")));;设置备份文件的路径
 (setq backup-by-copying t);;备份设置方法，直接拷贝
;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉
;; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一
;; 个固定的地方("~/backups")。对于每个备份文件，保留最原始的两个版本和最新的
;; 1个版本。并且备份的时候，备份文件是复本，而不是原件。

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
;;把这些缺省禁用的功能打开。

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;;设置home键指向buffer开头，end键指向buffer结尾

(defun du-onekey-compile ()
"Save buffers and start compile"
(interactive)
(save-some-buffers t)
(switch-to-buffer-other-window "*compilation*")
(compile compile-command))
(global-set-key [C-f6] 'compile)
(global-set-key [f6] 'du-onekey-compile)
;; C-f6, 设置编译命令; f6, 保存所有文件然后编译当前窗口文件

(global-set-key [C-f2] 'previous-error)
(global-set-key [f2] 'next-error)

(defun open-eshell-other-buffer ()
"Open eshell in other buffer"
(interactive)
(split-window-vertically)
(eshell))
(global-set-key [(f1)] 'open-eshell-other-buffer)
(global-set-key [C-f1] 'eshell)
;;目的是开一个shell的小buffer，用于更方便地测试程序(也就是运行程序了)，我经常会用到。
;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell


(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chunyu")
;; 设置时间戳，标识出最后一次保存文件的时间。

(global-set-key (kbd "M-g") 'goto-line)
;;设置M-g为goto-line



;; 不要menu-bar和tool-bar
;; (unless window-system
;;   (menu-bar-mode -1))
(menu-bar-mode -1)
;; GUI下显示toolbar的话select-buffer会出问题
(if (fboundp 'tool-bar-mode)
	(tool-bar-mode -1))

;; desktop,用来保存Emacs的桌面环境 — buffers、以及buffer的文件名、major modes和位置等等
 (require 'desktop-settings)
(load "desktop") 
(desktop-load-default) 
(desktop-read) 
;; session,可以保存很多东西，例如输入历史(像搜索、打开文件等的输入)、
;; register的内容、buffer的local variables以及kill-ring和最近修改的文件列表等。非常有用。
(require 'session-settings)
(require 'session) ;再次启动emacs时恢复到上次编辑场景
(add-hook 'after-init-hook 'session-initialize) 

;; Emacs才是世界上最强大的IDE － 智能的改变光标形状
;; http://emacser.com/cursor-change.htm
(require 'cursor-change)
(cursor-change-mode 1)
 

;; 增加更丰富的高亮
(require 'generic-x)

(require 'color-theme);主题颜色
(color-theme-gray30)
;(require 'color-theme-ahei)
;(color-theme-ahei)
;(color-theme-ld-dark)
;(color-theme-subtle-hacker)
;(color-theme-kingsajz)

;;时间显示设置
;;启用时间显示设置，在minibuffer上面的那个杠上（忘了叫什么来着）
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间栏旁边启用邮件设置
(setq display-time-use-mail-icon t)
;;时间的变化频率，单位多少来着？
(setq display-time-interval 10)

;;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了
(mouse-avoidance-mode 'animate)

;;滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
scroll-margin 3
scroll-conservatively 10000)

;;高亮当前行
;(require 'hl-line)
;(global-hl-line-mode t)

;evernote 配置
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; option
(require 'evernote-mode)
(global-set-key "\C-cec" 'evernote-create-note)
(global-set-key "\C-ceo" 'evernote-open-note)
(global-set-key "\C-ces" 'evernote-search-notes)
(global-set-key "\C-ceS" 'evernote-do-saved-search)
(global-set-key "\C-cew" 'evernote-write-note)
(global-set-key "\C-cep" 'evernote-post-region)
(global-set-key "\C-ceb" 'evernote-browser)

;; 关闭buffer的时候, 如果该buffer有对应的进程存在, 不提示, 烦
(delq 'process-kill-buffer-query-function kill-buffer-query-functions)

;时间戳
(defun insert-time-stamp()
(interactive)
  (let ((hour (nth 2 (decode-time)))
    (min (nth 1 (decode-time)))
    (day (nth 3 (decode-time)))
    (mon (nth 4 (decode-time)))
    (year (nth 5 (decode-time))))
    (insert (format "%d/%d/%d:%d-%d" year mon day hour min))
  )
)
(global-set-key "\C-ci" 'insert-time-stamp)

;;org配置
;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;(add-hook 'org-mode-hook 'turn-on-font-lock)
;(add-hook 'org-mode-hook 
;(lambda () (setq truncate-lines nil)))
; 
;(global-set-key "\C-cl" 'org-store-link)
;(global-set-key "\C-ca" 'org-agenda)
;(global-set-key "\C-cb" 'org-iswitchb)
;(setq org-publish-project-alist
;      '(("note-org"
;         :base-directory "~/.emacs.d/org"
;         :publishing-directory "/publish"
;         :base-extension "org"
;         :recursive t
;         :publishing-function org-publish-org-to-html
;         :auto-index nil
;         :index-filename "index.org"
;         :index-title "index"
;         :link-home "index.html"
;         :section-numbers nil
;         :style "<link rel=\"stylesheet\"
;    href=\"./style/emacs.css\"
;    type=\"text/css\"/>")
;        ("note-static"
;         :base-directory "~/.emacs.d/org/org"
;         :publishing-directory "/publish"
;         :recursive t
;         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
;         :publishing-function org-publish-attachment)
;        ("note" 
;         :components ("note-org" "note-static")
;         :author "914793713@qq.com"
;         )))
;
;(global-set-key "\C-xp" 'org-publish)

;;w3m 配置
;(require 'w3m-load)  
;(setq w3m-use-favicon nil)  
;(setq w3m-command-arguments '("-cookie" "-F"))  
;(setq w3m-use-cookies t)  ;打开cookie支持  
;(setq w3m-home-page "www.google.com")  ;设置主页  
;(setq w3m-default-display-inline-image t) ;显示图片  
;(setq w3m-default-toggle-inline-images t)  

;启动服务器模式
;(server-start)


;;让 dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)


;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插
;;入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;ibuffer 配置
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;<C-tab>切换emacs的buffers
 (require 'wcy-swbuff)
;; then you can use <C-tab> and <C-S-kp-tab> to switch buffer.
 (global-set-key (kbd "<C-tab>") 'wcy-switch-buffer-forward)
 (global-set-key (kbd "<C-S-kp-tab>") 'wcy-switch-buffer-backward)
(setq wcy-switch-buffer-active-buffer-face  'highlight)
(setq wcy-switch-buffer-inactive-buffer-face  'secondary-selection )

;配置Semantic的检索范围:
(setq semanticdb-project-roots
(list(expand-file-name "/")))


;补全配置
(autoload 'senator-try-expand-semantic "senator")
;(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key [(tab)] 'hippie-expand)


(defun he-tag-beg ()
  (let ((p
         (save-excursion 
           (backward-word 1)
           (point))))
    p))

(defun try-expand-tag (old)
  (unless  old
    (he-init-string (he-tag-beg) (point))
    (setq he-expand-list (sort
                          (all-completions he-search-string 'tags-complete-tag) 'string-lessp)))
  (while (and he-expand-list
              (he-string-member (car he-expand-list) he-tried-table))
              (setq he-expand-list (cdr he-expand-list)))
  (if (null he-expand-list)
      (progn
        (when old (he-reset-string))
        ())
    (he-substitute-string (car he-expand-list))
    (setq he-expand-list (cdr he-expand-list))
    t))

(setq hippie-expand-try-functions-list
      '( senator-try-expand-semantic try-expand-all-abbrevs try-expand-dabbrev
 try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill
 try-complete-lisp-symbol-partially try-complete-lisp-symbol
 try-complete-file-name-partially try-complete-file-name try-expand-tag))

; 改造你的C-w和M-w键
(defadvice kill-ring-save (before slickcopy activate compile)
   (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
	    (line-beginning-position 2)))))
(defadvice kill-region (before slickcut activate compile)
   (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
	    (line-beginning-position 2)))))
