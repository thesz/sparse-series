-- |SparseSe.hs
--
-- Sparse series.
--
-- Explanation is coming soon.
--
-- Copyright (C) 2017 Serguey Zefirov

module SparseSe where

import qualified Data.Map.Strict as Map

import qualified Data.Vector.Unboxed as UV

import Data.Word

type BV = UV.Vector Word64

data Sparse a =
	Sparse { sparseValues :: !(UV.Vector a), sparseNonZero, sparseCounts :: !BV }
	deriving (Show)

-- |Sparse series.
-- 
data SpSe a = SpSe {
	  spseCurrentIndex	:: !Int		-- |Row index.
	, spseSparses		:: [Sparse a]	-- |log structured sequence.
	, spseMap		:: !(Map.Map (Int, Int) a)	-- |Top-level cache.
	}
	deriving (Show)

