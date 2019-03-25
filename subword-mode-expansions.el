;;; subword-mode-expansions.el --- subword-mode support for expand-region -*- lexical-binding: t -*-

;; Copyright (C) 2014  Lefteris Karapetsas
;; Copyright (C) 2019  Free Software Foundation, Inc.

;; Author: Lefteris Karapetsas
;; Maintainer: Andrew Whatson <whatson@gmail.com>
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
  (when (and subword-mode
             expand-region-subword-enabled)
    (subword-right 1)
    (set-mark (point))
    (subword-left 1)))

(defun er/add-subword-mode-expansions ()
  "Install subword expansions for the current buffer."
  (make-local-variable 'er/try-expand-list)
  (add-to-list 'er/try-expand-list #'er/mark-subword))

(defun er/enable-subword-mode-expansions ()
  "Install subword expansions for all buffers in `subword-mode'."
  (add-hook 'subword-mode-hook #'er/add-subword-mode-expansions)
  (save-window-excursion
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (when subword-mode
          (er/add-subword-mode-expansions))))))

(er/enable-subword-mode-expansions)

(provide 'subword-mode-expansions)
;;; subword-mode-expansions.el ends here
