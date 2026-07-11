import contactHtml from "../contact.html?raw";
import emergencyEngineeringHtml from "../emergency-engineering.html?raw";
import homeHtml from "../index.html?raw";
import newEnergyHtml from "../new-energy.html?raw";
import riskEarlyWarningHtml from "../risk-early-warning.html?raw";

const htmlHeaders = {
  "content-type": "text/html; charset=utf-8",
  "cache-control": "public, max-age=60",
};

export const sitePages = {
  home: homeHtml,
  contact: contactHtml,
  emergencyEngineering: emergencyEngineeringHtml,
  riskEarlyWarning: riskEarlyWarningHtml,
  newEnergy: newEnergyHtml,
};

export function htmlResponse(html: string) {
  return new Response(html, { headers: htmlHeaders });
}
