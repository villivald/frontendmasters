import { darken } from "polished";

import { primaryColors, neutralColors } from "./colors";
import { headerFont, subheaderFont, bodyFont } from "./typography";

export const defaultTheme = {
  primaryYellow: primaryColors.yellow,
  primaryYellowOnHover: darken(0.1, primaryColors.yellow),
  primaryRed: primaryColors.red,
  primaryGreen: primaryColors.green,
  primaryGreenOnHover: darken(0.1, primaryColors.green),
  primaryGrey: primaryColors.grey,
  primaryDark: primaryColors.dark,
  white: neutralColors.white,
  textColorOnPrimary: neutralColors.white,
  textColor: neutralColors.black,
  textColorInverted: neutralColors.white,
  primaryFont: bodyFont,
  headerFont: headerFont,
  subHeaderFont: subheaderFont,
};

export const darkTheme = {
  primaryYellow: neutralColors.black,
  primaryYellowOnHover: darken(0.1, neutralColors.black),
  primaryRed: neutralColors.black,
  primaryGreen: neutralColors.black,
  primaryGreenOnHover: darken(0.1, neutralColors.black),
  primaryGrey: neutralColors.black,
  primaryDark: neutralColors.black,
  white: neutralColors.white,
  textColorOnPrimary: neutralColors.white,
  textColor: neutralColors.black,
  textColorInverted: neutralColors.white,
  primaryFont: bodyFont,
  headerFont: headerFont,
  subHeaderFont: subheaderFont,
};
