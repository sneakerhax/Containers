# ChatGPT 4o generated
import xml.etree.ElementTree as ET
import sys
import argparse
import os

def parse_nmap_xml(nmap_file, use_ip):
    try:
        # Ensure file exists
        if not os.path.exists(nmap_file):
            print(f"Error: File '{nmap_file}' not found.")
            sys.exit(1)

        tree = ET.parse(nmap_file)
        root = tree.getroot()

        for host in root.findall('host'):
            # Extract IP
            ip_elem = host.find('address')
            ip = ip_elem.get('addr') if ip_elem is not None else None

            # Extract Hostname
            hostname_elem = host.find('hostnames/hostname')
            hostname = hostname_elem.get('name') if hostname_elem is not None else None

            # Decide whether to use IP or hostname
            target = ip if (use_ip or not hostname) else hostname

            # Ensure target is not None
            if target is None:
                continue  # Skip entries without valid IP or hostname

            # Process Open Ports
            for port in host.findall('ports/port'):
                port_num = port.get('portid')
                state = port.find('state').get('state')

                if state == "open":
                    print(f"{target}:{port_num}")

    except ET.ParseError:
        print("Error: Failed to parse XML. Ensure the file is a valid Nmap XML output.")
        sys.exit(1)
    except Exception as e:
        print(f"Unexpected Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert Nmap XML output to httpx format.")
    parser.add_argument("nmap_file", help="Nmap XML output file")
    parser.add_argument("-ip", action="store_true", help="Use IP:Port format")
    parser.add_argument("-domain", action="store_true", help="Use Domain:Port format")

    args = parser.parse_args()

    # If neither flag is provided, default to domain output
    use_ip = args.ip or not args.domain

    parse_nmap_xml(args.nmap_file, use_ip)