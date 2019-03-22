;;; expand-region-subword.el --- Plugin for expand-region subword-mode support

;; Copyright (C) 2019 Andrew Whatson

;; Author: Andrew Whatson <whatson@gmail.com>
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

;; Auto-load the subword-mode expansions for expand-region.

;;; Code:

(eval-after-load 'subword '(require 'subword-mode-expansions))

(provide 'expand-region-subword)
;;; expand-region-subword.el ends here
