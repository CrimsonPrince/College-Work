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
 * a letter in the typeset. Letters consist of 15 possible locations (letter coordinates) numbered from top left (1) to bootom
 * right (15).<br>
 * e.g. the letter A consists of the 4 lines:<br>
 * 1-3, 7-9, 1-13, 3-15<br>
 * <BR>
 * <tt>
 * 01  02  03<br>
 * 04  05  06<br>
 * 07  08  09<br>
 * 10  11  12<br>
 * 13  14  15<br>
 * </tt>
 * 
 * @author iluvatar
 * @version 20071119
 */
class Letter {
	/** the lines for this letter */
	private Line[] mLines;

	/** the width of the letter in letter coordinates */
	private int mLineWidth;

	/** the width of the letter in pixel */
	private int mPixelWidth;

	/** the char represented by this letter */
	private char mValue;

	/**
	 * create a letter from it's line description.
	 * 
	 * @param pMovingLetters
	 *            reference to the typeset containing this letter.
	 * @param pChar
	 *            the char represented by this letter
	 * @param pLineDef
	 *            the line definition as list of start/end letter coordinates.
	 */
	public Letter(MovingLetters pMovingLetters, char pChar, int[][] pLineDef) {
		mValue = pChar;

		mLines = new Line[0];

		for (int i = 0; i < pLineDef.length; i++) {
			Line l = new Line(pMovingLetters, pLineDef[i][0], pLineDef[i][1]);
			mLines = (Line[]) PApplet.append(mLines, l);
			mLineWidth = PApplet.max(mLineWidth, l.getWidth());
		}
	}

	/**
	 * calculate the width of the letter in pixel. must be called prior to all drawing operations.
	 * 
	 * @param pHeight
	 *            the wanted height of the letter.
	 */
	void calculatePixelWidth(int pHeight) {
		if (mLines.length == 0) {
			mLineWidth = 3;
		}
		mPixelWidth = pHeight * mLineWidth / 4;
	}

	/**
	 * get width of the letter in pixel.
	 * 
	 * @return width of the letter in pixel.
	 */
	int getPixelWidth() {
		return mPixelWidth;
	}

	/**
	 * get the char represented by this letter.
	 * 
	 * @return the char represented by this letter.
	 */
	char getValue() {
		return mValue;
	}

	/**
	 * draw the letter.
	 * 
	 * @param pBaseX
	 *            x-base coordinate for the letter coordinate 1.
	 * @param pBaseY
	 *            y-base coordinate for the letter coordinate 1.
	 * @param pDotSize
	 *            size of dots at start and end. 0 for no dot.
	 * @param pLineWidth
	 *            line width.
	 */
	void paint(int pBaseX, int pBaseY, int pDotSize, int pLineWidth) {
		for (int i = 0; i < mLines.length; i++) {
			mLines[i].paint(pBaseX, pBaseY, pDotSize, pLineWidth);
		}
	}

	/**
	 * {@inheritDoc}
	 * 
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		return "Letter(" + mValue + ")";
	}
}
