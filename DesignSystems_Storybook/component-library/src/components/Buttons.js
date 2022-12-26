import styled from "styled-components";
import { defaultTheme, typeScale } from "../utils";

const Button = styled.button`
  padding: 10px 20px;
  font-size: ${typeScale.paragraph};
  border-radius: 5px;
  cursor: pointer;
  width: 10rem;
  font-family: ${defaultTheme.primaryFont};
  transition: background-color 0.2s linear, color 0.2s linear;
`;

export const PrimaryButton = styled(Button)`
  background-color: ${defaultTheme.primaryYellow};
  border: none;
  color: ${defaultTheme.textColorOnPrimary};
  &:hover {
    background-color: ${defaultTheme.primaryYellowOnHover};
    color: ${defaultTheme.textColorOnPrimary};
  }
  &:focus {
    outline: 3px solid ${defaultTheme.primaryYellow};
    outline-offset: 2px;
  }
  &:active {
    outline: none;
    transform: translateY(2px);
  }
  &:disabled {
    background-color: ${defaultTheme.primaryGrey};
    color: ${defaultTheme.textColorOnPrimary};
    cursor: not-allowed;
  }
`;

export const SecondaryButton = styled(Button)`
  background-color: ${defaultTheme.primaryGreen};
  border: none;
  color: ${defaultTheme.textColorOnPrimary};
  &:hover {
    background-color: ${defaultTheme.primaryGreenOnHover};
    color: ${defaultTheme.textColorOnPrimary};
  }
  &:focus {
    outline: 3px solid ${defaultTheme.primaryGreen};
    outline-offset: 2px;
  }
  &:active {
    outline: none;
    transform: translateY(2px);
  }
`;

export const TertiaryButton = styled(Button)`
  background-color: ${defaultTheme.white};
  border: 2px solid ${defaultTheme.primaryDark};
  color: ${defaultTheme.textColor};
  &:hover {
    background-color: ${defaultTheme.primaryDark};
    color: ${defaultTheme.textColorOnPrimary};
  }
  &:focus {
    outline: 3px solid ${defaultTheme.primaryDark};
    outline-offset: 2px;
  }
  &:active {
    outline: none;
    transform: translateY(2px);
  }
`;
