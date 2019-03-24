;;; subword-mode-expansions.el --- Expansions for subword-mode to be used for CamelCase

;; Copyright (C) 2014 Lefteris Karapetsas

;; Author: Lefteris Karapetsas
;; Keywords: marking region

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides extra expansions for subword mode so that when subword-mode
;; is non-nil different words can be selected in CamelCase.

;;; Code:

(require 'expand-region-core)
(require 'subword)

(defun er/mark-subword ()
  "Mark a subword, a part of a CamelCase identifier."
  (interactive)
  (when expand-region-subword-enabled
    (if mark-active
        (progn
          (exchange-point-and-mark)
          (subword-right 1)
          (exchange-point-and-mark))
      (subword-right 1)
      (set-mark (point))
      (subword-left 1))))

(defun er/add-subword-mode-expansions ()
  "Add expansions for buffers in `subword-mode'."
  (set (make-local-variable 'er/try-expand-list)
       (append er/try-expand-list
               '(er/mark-subword))))

;; compatiblity with expand-region-0.11.0
(unless (functionp 'er/enable-minor-mode-expansions)
  (defun er/enable-minor-mode-expansions (mode add-fn)
    (add-hook (intern (format "%s-hook" mode)) add-fn)
    (save-window-excursion
      (dolist (buffer (buffer-list))
        (with-current-buffer buffer
          (when (symbol-value mode)
            (funcall add-fn)))))))

(er/enable-minor-mode-expansions 'subword-mode 'er/add-subword-mode-expansions)

(provide 'subword-mode-expansions)
;;; subword-mode-expansions.el ends here
