-- |SparseSe.hs
--
-- Sparse series.
--
-- Explanation is coming soon.
--
-- Copyright (C) 2017 Serguey Zefirov

{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS -Wno-tabs #-}

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
	  spseCurrentRowIndex	:: !Int		-- |Row index.
	, spseSparses		:: [Sparse a]	-- |log structured sequence.
	, spseCache		:: !(Map.Map (Int,Int) a)	-- |Cache for several last rows.
	, spseRow		:: !(Map.Map Int a)	-- |Current row cache
	}
	deriving (Show)

empty :: SpSe a
empty = SpSe 0 [] Map.empty Map.empty

insertToRow :: (Eq a, Num a) => Int -> a -> SpSe a -> SpSe a
insertToRow k a spse@(SpSe{..})
	| a == 0 = spse
	| otherwise = SpSe spseCurrentRowIndex spseSparses spseCache $
		Map.insert k a spseRow

newRow :: SpSe a -> SpSe a
newRow spse@(SpSe{..}) = undefined
