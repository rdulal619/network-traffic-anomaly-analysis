-- SQL Diagnostic: Network Traffic Analysis
-- Author: Reshan Dulal

-- Q1: Total bytes transferred per protocol
SELECT
    protocol,
    SUM(bytes_transferred) AS total_bytes
FROM network_logs
GROUP BY protocol;

-- Q2: Top 5 source IPs by total bytes transferred
SELECT
    src_ip,
    SUM(bytes_transferred) AS total_bytes
FROM network_logs
GROUP BY src_ip
ORDER BY total_bytes DESC
LIMIT 5;

-- Q3: Average packet size per protocol (only protocols with >1000 records)
SELECT
    protocol,
    AVG(packet_size) AS avg_packet_size
FROM network_logs
GROUP BY protocol
HAVING COUNT(*) > 1000;

-- Q4: Records where packet size is greater than overall average
SELECT *
FROM network_logs
WHERE packet_size > (
    SELECT AVG(packet_size)
    FROM network_logs
);

-- Q5: Rank destinations by total bytes transferred per source IP
SELECT
    src_ip,
    dest_ip,
    SUM(bytes_transferred) AS total_bytes,
    RANK() OVER (
        PARTITION BY src_ip
        ORDER BY SUM(bytes_transferred) DESC
    ) AS destination_rank
FROM network_logs
GROUP BY src_ip, dest_ip;
