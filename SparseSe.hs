-- |SparseSe.hs
--
-- Sparse series.
--
-- Explanation is coming soon.
--
-- Copyright (C) 2017 Serguey Zefirov

module SparseSe where

import qualified Data.Map as Map

import qualified Data.Vector.Unboxed as UV

import Data.Word

type BV = UV.Vector Word64

data SSe a =
	SSe (UV.Vector a) BV BV
	deriving (Eq, Ord, Show)

