#!/bin/bash
echo "Starting improved manual build..."
echo "Current directory: $(pwd)"
echo "Files in current directory:"
ls -la

# Create output directory
mkdir -p dist

# Create a simple placeholder regardless of whether public/index.html exists
cat > dist/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FPGA Circuit Viewer</title>
  <style>
    body { font-family: Arial, sans-serif; max-width: 800px; margin: 0 auto; padding: 20px; }
    ul { list-style-type: none; padding: 0; }
    li { padding: 10px; margin: 5px 0; background: #f5f5f5; border-radius: 4px; }
    h1 { color: #333; }
  </style>
</head>
<body>
  <h1>FPGA Circuit Viewer</h1>
  <div id="loading">Loading circuits...</div>
  <ul id="circuits"></ul>

  <script>
    const API_URL = 'https://two024-2025-project-4-web-fpga-team-2.onrender.com';
    
    fetch(`${API_URL}/student-circuits`)
      .then(response => response.json())
      .then(data => {
        document.getElementById('loading').style.display = 'none';
        const circuitsList = document.getElementById('circuits');
        
        data.forEach(circuit => {
          const li = document.createElement('li');
          li.textContent = `${circuit.name} - ${circuit.description}`;
          circuitsList.appendChild(li);
        });
      })
      .catch(error => {
        document.getElementById('loading').textContent = 'Error loading circuits. See console for details.';
        console.error('Error fetching circuits:', error);
      });
  </script>
</body>
</html>
EOF

echo "Created index.html in dist directory"

# List the contents of the dist directory
echo "Contents of dist directory:"
ls -la dist/

# Copy any public files if they exist
if [ -d "public" ]; then
  cp -r public/* dist/ || true
  echo "Copied public files"
fi

echo "Manual build completed!"