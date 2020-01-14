/*
 Copyright (C) 2007 Andre Seidelt, All Rights Reserved.

 This software is provided 'as-is', without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from the
 use of this software.

 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it
 freely, subject to the following restrictions:

 1. The origin of this software must not be misrepresented; you must not
 claim that you wrote the original software. If you use this software in
 a product, an acknowledgment in the product documentation would be
 appreciated but is not required.

 2. Altered source versions must be plainly marked as such, and must not be
 misrepresented as being the original software.

 3. This notice may not be removed or altered from any source distribution.
 */
package de.ilu.movingletters;

import processing.core.PApplet;

/**
 * a typeset for moving letters with given size and agility.
 * 
 * @author iluvatar
 * @version 20071119
 */
public class MovingLetters {
	/** number of letter coordinates */
	private static final int NUM_LETTER_COORDINATES = 15;

	/** letter definition */
	private Letter[] mFont = {
			new Letter(this, 'A', new int[][] { { 1, 3 }, { 7, 9 }, { 1, 13 }, { 3, 15 } }),
			new Letter(this, 'B', new int[][] { { 1, 2 }, { 2, 6 }, { 6, 12 }, { 12, 14 }, { 13, 14 }, { 1, 13 }, { 7, 9 } }),
			new Letter(this, 'C', new int[][] { { 1, 3 }, { 1, 13 }, { 13, 15 } }),
			new Letter(this, 'D', new int[][] { { 1, 2 }, { 2, 6 }, { 6, 12 }, { 12, 14 }, { 13, 14 }, { 1, 13 } }),
			new Letter(this, 'E', new int[][] { { 1, 3 }, { 1, 13 }, { 7, 9 }, { 13, 15 } }),
			new Letter(this, 'F', new int[][] { { 1, 3 }, { 1, 13 }, { 7, 8 } }),
			new Letter(this, 'G', new int[][] { { 3, 6 }, { 1, 3 }, { 1, 13 }, { 13, 15 }, { 9, 15 }, { 8, 9 } }),
			new Letter(this, 'H', new int[][] { { 7, 9 }, { 1, 13 }, { 3, 15 } }),
			new Letter(this, 'I', new int[][] { { 1, 13 } }),
			new Letter(this, 'J', new int[][] { { 3, 15 }, { 13, 15 }, { 10, 13 } }),
			new Letter(this, 'K', new int[][] { { 1, 13 }, { 3, 7 }, { 7, 15 } }),
			new Letter(this, 'L', new int[][] { { 1, 13 }, { 13, 15 } }),
			new Letter(this, 'M', new int[][] { { 1, 13 }, { 1, 8 }, { 3, 8 }, { 3, 15 } }),
			new Letter(this, 'N', new int[][] { { 1, 13 }, { 1, 15 }, { 3, 15 } }),
			new Letter(this, 'O', new int[][] { { 1, 3 }, { 1, 13 }, { 3, 15 }, { 13, 15 } }),
			new Letter(this, 'P', new int[][] { { 1, 13 }, { 1, 3 }, { 3, 9 }, { 7, 9 } }),
			new Letter(this, 'Q', new int[][] { { 1, 3 }, { 1, 13 }, { 3, 15 }, { 13, 15 }, { 11, 15 } }),
			new Letter(this, 'R', new int[][] { { 1, 13 }, { 1, 3 }, { 3, 9 }, { 7, 9 }, { 7, 15 } }),
			new Letter(this, 'S', new int[][] { { 1, 3 }, { 1, 7 }, { 7, 9 }, { 9, 15 }, { 13, 15 } }),
			new Letter(this, 'T', new int[][] { { 1, 3 }, { 2, 14 } }),
			new Letter(this, 'U', new int[][] { { 1, 13 }, { 13, 15 }, { 3, 15 } }),
			new Letter(this, 'V', new int[][] { { 1, 14 }, { 3, 14 } }),
			new Letter(this, 'W', new int[][] { { 1, 13 }, { 11, 13 }, { 11, 15 }, { 3, 15 } }),
			new Letter(this, 'X', new int[][] { { 1, 15 }, { 3, 13 } }),
			new Letter(this, 'Y', new int[][] { { 1, 8 }, { 3, 8 }, { 8, 14 } }),
			new Letter(this, 'Z', new int[][] { { 1, 3 }, { 3, 13 }, { 13, 15 } }),
			new Letter(this, '0', new int[][] { { 1, 3 }, { 1, 13 }, { 3, 15 }, { 13, 15 }, { 3, 13 } }),
			new Letter(this, '1', new int[][] { { 3, 5 }, { 3, 15 } }),
			new Letter(this, '2', new int[][] { { 1, 3 }, { 3, 9 }, { 7, 9 }, { 7, 13 }, { 13, 15 } }),
			new Letter(this, '3', new int[][] { { 1, 3 }, { 7, 9 }, { 13, 15 }, { 3, 15 } }),
			new Letter(this, '4', new int[][] { { 1, 7 }, { 7, 9 }, { 3, 15 } }),
			new Letter(this, '5', new int[][] { { 1, 3 }, { 1, 7 }, { 7, 9 }, { 9, 15 }, { 13, 15 } }),
			new Letter(this, '6', new int[][] { { 1, 3 }, { 1, 13 }, { 7, 9 }, { 9, 15 }, { 13, 15 } }),
			new Letter(this, '7', new int[][] { { 1, 3 }, { 3, 15 } }),
			new Letter(this, '8', new int[][] { { 1, 3 }, { 7, 9 }, { 1, 13 }, { 3, 15 }, { 13, 15 } }),
			new Letter(this, '9', new int[][] { { 1, 3 }, { 1, 7 }, { 3, 15 }, { 7, 9 }, { 13, 15 } }),
			new Letter(this, '-', new int[][] { { 7, 9 } }),
			new Letter(this, '_', new int[][] { { 13, 15 }, }),
			new Letter(this, '^', new int[][] { { 2, 4 }, { 2, 6 } }),
			new Letter(this, '/', new int[][] { { 3, 13 } }),
			new Letter(this, '\\', new int[][] { { 1, 15 } }),
			new Letter(this, '.', new int[][] { { 13, 13 } }),
			new Letter(this, ',', new int[][] { { 11, 13 } }),
			new Letter(this, ';', new int[][] { { 11, 13 }, { 8, 8 } }),
			new Letter(this, '=', new int[][] { { 4, 6 }, { 7, 9 } }),
			new Letter(this, '+', new int[][] { { 5, 11 }, { 7, 9 } }),
			new Letter(this, '*', new int[][] { { 5, 11 }, { 7, 9 }, { 4, 12 }, { 6, 10 } }),
			new Letter(this, '!', new int[][] { { 1, 10 }, { 13, 13 } }),
			new Letter(this, '?', new int[][] { { 1, 3 }, { 3, 9 }, { 8, 9 }, { 8, 11 }, { 14, 14 } }),
			new Letter(this, ':', new int[][] { { 4, 4 }, { 10, 10 } }),
			new Letter(this, '|', new int[][] { { 1, 13 } }),
			new Letter(this, '<', new int[][] { { 1, 9 }, { 9, 13 } }),
			new Letter(this, '>', new int[][] { { 3, 7 }, { 7, 15 } }),
			new Letter(this, '"', new int[][] { { 1, 4 }, { 2, 5 } }),
			new Letter(this, '#', new int[][] { { 2, 10 }, { 6, 14 }, { 4, 6 }, { 7, 9 } }),
			new Letter(this, '\'', new int[][] { { 1, 4 } }),
			new Letter(this, ' ', new int[][] {}),
			new Letter(this, ')', new int[][] { { 1, 5 }, { 5, 11 }, { 11, 13 } }),
			new Letter(this, '(', new int[][] { { 2, 4 }, { 4, 10 }, { 10, 14 } }),
			new Letter(this, (char) 0, new int[][] { { 1, 3 }, { 4, 6 }, { 7, 9 }, { 10, 12 }, { 13, 15 }, { 1, 13 }, { 2, 14 },
					{ 3, 15 } }), };

	/** reference to the processing runtime */
	private PApplet mRuntime;

	/** list of letters indexable by character-values 0-255 */
	private Letter[] mLetters;

	/** list of pixel x-coordinates of the letter coordinates, all relative to letter coordinate 1 */
	private int[] mPointLocX;

	/** list of pixel y-coordinates of the letter coordinates, all relative to letter coordinate 1 */
	private int[] mPointLocY;

	/** agility of the letters */
	private int mAgility;

	/** height for the letters */
	private int mHeight;

	/** number of pixels to randomly move the letters */
	private int mJitter;

	/** number of pixels to randomly move the letters-helper value */
	private int mJitterHalf;

	/**
	 * create moving letters with given height and an agility of 1.
	 * 
	 * @param pRuntime
	 *            the reference to the processing runtime.
	 * @param pHeight
	 *            wanted height of the letters.
	 */
	public MovingLetters(PApplet pRuntime, int pHeight) {
		this(pRuntime, pHeight, 1);
	}

	/**
	 * create moving letters with given height and and agility.
	 * 
	 * @param pAgility
	 *            indicates for how many frames the pixel coordinates of the letter coordinates should kept unchanged.
	 * @param pRuntime
	 *            the reference to the processing runtime.
	 * @param pHeight
	 *            wanted height of the letters.
	 */
	public MovingLetters(PApplet pRuntime, int pHeight, int pAgility) {
		this(pRuntime, pHeight, pAgility, 4);
	}

	/**
	 * create moving letters with given height and and agility.
	 * 
	 * @param pAgility
	 *            indicates for how many frames the pixel coordinates of the letter coordinates should kept unchanged.
	 * @param pRuntime
	 *            the reference to the processing runtime.
	 * @param pHeight
	 *            wanted height of the letters.
	 * @param pJitter
	 *            number of pixels to randomly move the edges of the letters. This must be divideable by 2!
	 */
	public MovingLetters(PApplet pRuntime, int pHeight, int pAgility, int pJitter) {
		if ((pJitter % 2) != 0) {
			throw new RuntimeException("pJitter has to be divideable by 2!");
		}

		mRuntime = pRuntime;
		mAgility = pAgility;
		mHeight = pHeight;
		mJitter = pJitter;
		mJitterHalf = pJitter / 2;
		mPointLocX = new int[NUM_LETTER_COORDINATES];
		mPointLocY = new int[NUM_LETTER_COORDINATES];

		mLetters = new Letter[256];
		for (int i = 0; i < mFont.length; i++) {
			mFont[i].calculatePixelWidth(pHeight);

			char lower = Character.toLowerCase(mFont[i].getValue());
			char upper = Character.toUpperCase(mFont[i].getValue());
			mLetters[lower] = mFont[i];
			mLetters[upper] = mFont[i];
		}
		calcPointLoc(1);
	}

	/**
	 * draw text at given coordinate. Use no dots and line width is 1.
	 * 
	 * @param pData
	 *            text string.
	 * @param pX
	 *            x-xoordinate for upper left corner of first letter.
	 * @param pY
	 *            y-xoordinate for upper left corner of first letter.
	 */
	public void text(String pData, int pX, int pY) {
		text(pData, pX, pY, 0);
	}

	/**
	 * draw text at given coordinate. Line width is 1.
	 * 
	 * @param pData
	 *            text string.
	 * @param pX
	 *            x-xoordinate for upper left corner of first letter.
	 * @param pY
	 *            y-xoordinate for upper left corner of first letter.
	 * @param pDotSize
	 *            size of dots to draw at start/end of lines. 0 for no dots.
	 */
	public void text(String pData, int pX, int pY, int pDotSize) {
		text(pData, pX, pY, pDotSize, 1);
	}

	/**
	 * draw text at given coordinate.
	 * 
	 * @param pData
	 *            text string.
	 * @param pX
	 *            x-xoordinate for upper left corner of first letter.
	 * @param pY
	 *            y-xoordinate for upper left corner of first letter.
	 * @param pDotSize
	 *            size of dots to draw at start/end of lines. 0 for no dots.
	 * @param pLineWidth
	 *            width of the lines for the text.
	 */
	public void text(String pData, int pX, int pY, int pDotSize, int pLineWidth) {
		text(pData, pX, pY, pDotSize, 1, null);
	}

	/**
	 * draw text at given coordinate.
	 * 
	 * @param pData
	 *            text string.
	 * @param pX
	 *            x-xoordinate for upper left corner of first letter.
	 * @param pY
	 *            y-xoordinate for upper left corner of first letter.
	 * @param pDotSize
	 *            size of dots to draw at start/end of lines. 0 for no dots.
	 * @param pLineWidth
	 *            width of the lines for the text.
	 * @param pColors
	 *            an array of colors which can be used by the <b>#</b><i>color</i><b>;</b> syntax.
	 */
	public void text(String pData, int pX, int pY, int pDotSize, int pLineWidth, int[] pColors) {
		int xPos = pX;

		StringBuffer colorStr = new StringBuffer();

		calcPointLoc(mAgility);

		char[] chs = pData.toLowerCase().toCharArray();
		for (int i = 0; i < chs.length; i++) {
			char ch = chs[i];
			if (ch == '#') {
				if (((i + 1) < chs.length) && (chs[i + 1] == '#')) {
					// escape, simply use #
					i++;
				} else {
					// no escape, collect digits until ';'
					i++;
					colorStr.setLength(0);
					boolean endSeen = false;
					while (i < chs.length) {
						if (chs[i] == ';') {
							endSeen = true;
							break;
						} else if (Character.isDigit(chs[i])) {
							colorStr.append(chs[i]);
						} else {
							break;
						}
						i++;
					}
					// check for correct termination of color-escape
					if (!endSeen) {
						throw new RuntimeException("Illegal color escape, missing ';'");
					}
					// try to parse index
					int color = -1;
					try {
						color = Integer.parseInt(colorStr.toString());
					} catch (NumberFormatException e) {
						throw new RuntimeException("Illegal color escape", e);
					}
					// check if index is valid
					if ((pColors == null) || (color < 0) || (color >= pColors.length)) {
						throw new RuntimeException("Illegal color escape: " + color);
					}
					// set color
					mRuntime.stroke(pColors[color]);
					continue;
				}
			}

			Letter letter = mLetters[ch];
			if (letter == null) {
				letter = mLetters[0];
			}
			letter.paint(xPos, pY, pDotSize, pLineWidth);

			xPos += letter.getPixelWidth();
		}
	}

	/**
	 * get a pixel x-coordinate for a letter coordinate.
	 * 
	 * @param pPos
	 *            letter coordinate.
	 * 
	 * @return pixel coordinate.
	 */
	int getX(int pPos) {
		return mPointLocX[pPos];
	}

	/**
	 * get a pixel y-coordinate for a letter coordinate.
	 * 
	 * @param pPos
	 *            letter coordinate.
	 * 
	 * @return pixel coordinate.
	 */
	int getY(int pPos) {
		return mPointLocY[pPos];
	}

	/**
	 * (re)calculate pixel coordinates for letter coordinates relative to letter coordinate 1.
	 * 
	 * @param pMovement
	 */
	private void calcPointLoc(int pMovement) {
		if ((pMovement == 0) || (mRuntime.frameCount % pMovement != 0)) {
			return;
		}

		int ph2 = (int) (mHeight / 2f);
		int ph4 = (int) (mHeight / 4f);
		int ph6 = (ph2 + ph4);
		int cnt = 0;

		// line 1-3
		mPointLocX[cnt] = (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		mPointLocX[cnt] = ph4 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		mPointLocX[cnt] = ph2 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		// line 4-6
		mPointLocX[cnt] = (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = ph4 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		mPointLocX[cnt] = ph4 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = ph4 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		mPointLocX[cnt] = ph2 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = ph4 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		// line 7-9
		mPointLocX[cnt] = (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = ph2 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		mPointLocX[cnt] = ph4 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = ph2 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		mPointLocX[cnt] = ph2 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = ph2 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		// line 10-12
		mPointLocX[cnt] = (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = ph6 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		mPointLocX[cnt] = ph4 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = ph6 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		mPointLocX[cnt] = ph2 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = ph2 + ph4 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		// line 10-12
		mPointLocX[cnt] = (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = mHeight + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		mPointLocX[cnt] = ph4 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = mHeight + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;

		mPointLocX[cnt] = ph2 + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		mPointLocY[cnt] = mHeight + (int) mRuntime.random(1, mJitter) - mJitterHalf;
		cnt++;
	}

	/**
	 * get processing runtime.
	 * 
	 * @return processing runtime.
	 */
	PApplet getRuntime() {
		return mRuntime;
	}
}
