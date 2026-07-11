import { htmlResponse, sitePages } from "../site-html";

export function GET() {
  return htmlResponse(sitePages.emergencyEngineering);
}
